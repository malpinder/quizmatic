FactoryGirl.define do

  factory :quiz do
    association :user
    title "My first quiz"
    instructions "Answer the questions."
    published false
  end
end
