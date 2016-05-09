class ApplicationMailer < ActionMailer::Base
  default from: "vagabond-team@vagabond.com"
  layout 'mailer'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Vagabond!')
  end
end
