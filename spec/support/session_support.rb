module SessionSupport

  def sign_in(user)
    page.set_rack_session(user_token: user.session_token)
  end

end
