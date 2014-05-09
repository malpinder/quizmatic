class SessionController < ApplicationController

  def create
    user = User.find_by_login_token(params[:token])
    if user
      user.clear_login_token!
      session[:user_token] = user.session_token
      redirect_to root_path, notice: "You have been logged in."
    else
      redirect_to new_session_request_path, warning: "That link wasn't valid. Please request another."
    end
  end

  def destroy
    session[:user_token] = nil
    redirect_to root_path, notice: "You have been logged out."
  end

end
