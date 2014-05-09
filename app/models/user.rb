require './lib/tokenisable'

class User < ActiveRecord::Base

  include Tokenisable

  def generate_login_token!
    generate_token :login_token
    save!
  end

  def clear_login_token!
    self.login_token = nil
    save!
  end

end
