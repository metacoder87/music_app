class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def activation_email(user)
    @user = user
    mail(to: user.email, subject: "Welcome to this Music Catalog! Please activate your account.")
  end
end
