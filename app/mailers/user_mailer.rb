class UserMailer < ActionMailer::Base
  default from: "from@quizmatic.com"

  def welcome(user)
    @user = user
    mail to: user.email, subject: "Welcome to Quizmatic"
  end
end
