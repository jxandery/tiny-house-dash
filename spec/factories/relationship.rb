FactoryGirl.define do
  factory :relationship do
    coach_id 1
    participant_id 2
    start_date Date.today
    end_date nil
  end
end