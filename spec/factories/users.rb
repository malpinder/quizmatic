
FactoryGirl.define do

  sequence :token do |n|
    "abc-#{n}"
  end

  factory :user do
    sequence(:email) { |n| "user-#{n}@example.com" }
    sequence(:display_name) { |n| "User #{n}" }
    session_token { generate :token }
  end
end
