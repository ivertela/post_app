class PostNotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_notification_mailer.notify_user.subject
  #
  def notify_user(email, title, text)
    @email = email
    @title = title
    @text = text
    mail(to: @email, subject: 'Create Post')
  end

end
