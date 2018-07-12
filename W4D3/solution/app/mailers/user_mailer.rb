class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: user.username, subject: 'Welcome to 99 Cats!')
  end
end
