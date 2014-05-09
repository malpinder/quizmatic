class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      @user.generate_login_token!
      UserMailer.welcome(@user).deliver
      redirect_to root_path, notice: 'Please check your email for a registration link.'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :display_name)
  end
end
