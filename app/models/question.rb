class Question < ActiveRecord::Base

  belongs_to :quiz

  validates :quiz, presence: true
end
