class PostNotificationMailer < ApplicationMailer

  def notify_user(email, title, text)
    @email = email
    @title = title
    @text = text
    mail(to: @email, subject: 'Create Post')
  end

end
