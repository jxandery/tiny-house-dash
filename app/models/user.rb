class User < ActiveRecord::Base
  has_secure_password
  has_many :client_coaches, class_name: 'CoachClient',
                           foreign_key: 'client_id',
                           dependent: :destroy
  has_many :coach_clients, class_name: 'CoachClient',
                           foreign_key: 'coach_id',
                           dependent: :destroy
  has_many :coaches, through: :client_coaches, source: :coach
  has_many :clients, through: :coach_clients, source: :client

  def coach
    self.coaches.first
  end
end
