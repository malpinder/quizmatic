require 'spec_helper'
require './lib/tokenisable'

describe Tokenisable do

  class TokenisableTestClass
    include Tokenisable

    def [](field)
      attributes[field]
    end
    def []=(field, value)
      attributes[field] = value
    end
    def self.exists?(attributes)
      false
    end
    def attributes
      @attributes ||= {}
    end
  end

  subject { TokenisableTestClass.new }

  describe "#generate_token" do
    it "generates a random string for the given field" do
      subject.generate_token(:foo)
      expect(subject[:foo]).to be_kind_of String
    end
    it "continues until a unique string is found" do
      expect(TokenisableTestClass).to receive(:exists?).twice.and_return(true, false)
      subject.generate_token(:foo)
    end
  end

end
