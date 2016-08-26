class User < ActiveRecord::Base
  has_secure_password
  has_many :relationships, class_name: 'Relationship',
                           foreign_key: 'coach_id',
                           dependent: :destroy
  has_many :participants, through: :relationships

  def coach
    relationship = Relationship.where(participant_id: self.id, end_date: nil).first
    User.find(relationship.coach_id)
  end

  def coach_history
    relationships = Relationship.where(participant_id: self.id)
    relationships.map { |r| User.find(r.coach_id) }
  end

  def participant_history
    relationships = Relationship.where(coach_id: self.id)
    relationships.map { |r| User.find(r.participant_id) }
  end
end
