require 'test_helper'

class PostNotificationMailerTest < ActionMailer::TestCase
	test "notify_user" do
		mail = PostNotificationMailer.notify_user(
		'i.vertela@dunice.net', 'Test title', 'Test text')
		assert_equal "Create Post", mail.subject
		assert_equal ["i.vertela@dunice.net"], mail.to
		assert_equal ["suslik2995@yandex.ua"], mail.from
    # assert_match "Hi", mail.body.encoded
  end

end
