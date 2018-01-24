# Preview all emails at http://localhost:3000/rails/mailers/post_notification_mailer
class PostNotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/post_notification_mailer/notify_user
  def notify_user
    PostNotificationMailer.notify_user
  end

end
