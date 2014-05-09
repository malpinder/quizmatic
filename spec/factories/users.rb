
FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@example.com" }
    sequence(:display_name) { |n| "User #{n}" }
    session_token 'abc-123'
  end
end
