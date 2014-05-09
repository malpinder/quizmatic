class SessionRequestsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    user.generate_login_token!
    SessionRequestsMailer.login(user).deliver
    redirect_to root_path, notice: 'Please check your email for a login link.'
  end
end
