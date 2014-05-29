require 'spec_helper'

describe Question do
  describe "validations" do
    it "requires a quiz" do
      subject.quiz = nil
      expect(subject).to have(1).error_on(:quiz)
    end
  end
end
