require './lib/tokenisable'

class User < ActiveRecord::Base

  has_many :quizzes

  include Tokenisable

  def generate_login_token!
    generate_token :login_token
    save!
  end

  def reset_login_tokens!
    self.login_token = nil
    generate_token :session_token
    save!
  end

end
