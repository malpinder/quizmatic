require 'spec_helper'

describe Quiz do
  describe "validations" do
    it "requires a user" do
      subject.user = nil
      expect(subject).to have(1).error_on(:user)
    end
  end
end
