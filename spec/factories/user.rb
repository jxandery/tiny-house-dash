FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@gmail.com" }
    sequence(:username) { |n| "user#{n}" }
    password 'Password1'
  end
end
