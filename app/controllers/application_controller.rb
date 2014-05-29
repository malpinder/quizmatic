class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= session[:user_token] && User.find_by_session_token(session[:user_token])
  end
  helper_method :current_user

  def logged_in?
    current_user.present?
  end
  helper_method :logged_in?

  private

  def authenticate!
    unless logged_in?
      redirect_to new_session_request_path, warning: "You must be logged in to do that."
    end
  end
end
