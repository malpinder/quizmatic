class SessionRequestsMailer < ActionMailer::Base
  default from: "from@example.com"

  def login(user)
    @user = user
    mail to: user.email, subject: "Log in to Quizmatic"
  end
end
