FactoryGirl.define do

  factory :question do
    association :quiz
    body "Is this a question?"
    available_marks 1
  end
end
