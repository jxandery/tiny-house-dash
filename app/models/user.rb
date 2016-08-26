class User < ActiveRecord::Base
  has_secure_password
  has_many :participants_coaches, class_name: 'CoachParticipant',
                           foreign_key: 'participant_id',
                           dependent: :destroy
  has_many :coach_participants, class_name: 'CoachParticipant',
                           foreign_key: 'coach_id',
                           dependent: :destroy
  has_many :coaches, through: :participants_coaches, source: :coach
  has_many :participants, through: :coach_participants, source: :participant

  def coach
    coach_participant = CoachParticipant.where(participant_id: self.id, end_date: nil).first
    User.find(coach_participant.coach_id)
  end
end
