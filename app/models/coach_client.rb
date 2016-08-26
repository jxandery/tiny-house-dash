class CoachClient < ActiveRecord::Base
  belongs_to :coach, class_name: "User"
  belongs_to :client, class_name: "User"

  validates :coach_id, presence: true
  validates :client_id, presence: true
  validates :start_date, presence: true
end
