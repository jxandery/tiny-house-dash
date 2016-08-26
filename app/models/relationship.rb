class Relationship < ActiveRecord::Base
  belongs_to :coach, class_name: "User"
  belongs_to :participant, class_name: "User"

  validates :coach_id, presence: true
  validates :participant_id, presence: true
  validates :start_date, presence: true
end

