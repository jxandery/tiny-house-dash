class UserMailer < ActionMailer::Base
  default from: "welcome@example.com"

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: "welcome new user")
  end
end
