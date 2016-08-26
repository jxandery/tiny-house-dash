class User < ActiveRecord::Base
  has_secure_password
  has_many :clients_coaches, class_name: 'CoachClient',
                           foreign_key: 'client_id',
                           dependent: :destroy
  has_many :coach_clients, class_name: 'CoachClient',
                           foreign_key: 'coach_id',
                           dependent: :destroy
  has_many :coaches, through: :clients_coaches, source: :coach
  has_many :clients, through: :coach_clients, source: :client

  def coach
    coach_client = CoachClient.where(client_id: self.id, end_date: nil).first
    User.find(coach_client.coach_id)
  end
end
