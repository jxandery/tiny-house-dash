FactoryGirl.define do
  factory :coach_client do
    coach_id 1
    client_id 2
    start_date Date.today
    end_date nil
  end
end
