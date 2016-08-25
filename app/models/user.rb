class User < ActiveRecord::Base
  has_secure_password
  has_many :relationships, class_name: 'Relationship',
                           foreign_key: 'coach_id',
                           dependent: :destroy
  has_many :participants, through: :relationships

  def coach
    require "pry"; binding.pry
    Relationship.where(participant_id: self.id, end_date: nil)
  end
end
