class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://ninetyninecats.com/cats'
    mail(to: user.email, subject: 'Welcome to Ninety-9 Cats! Rent your cat TODAY!')
  end
end
