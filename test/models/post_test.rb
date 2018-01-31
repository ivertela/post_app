require 'test_helper'

class PostTest < ActiveSupport::TestCase
	def setup
		@post = posts(:valid)
	end

	class ValidPostTest < PostTest
		test 'invalid without title' do
			@post.title = nil
			refute @post.valid?
			assert_not_nil @post.errors[:title]
		end

		test 'invalid without desctiption' do
			@post.description = nil
			refute @post.valid?
			assert_not_nil @post.errors[:description]
		end

		test 'invalid without user' do
			@post.user = nil
			refute @post.valid?
			assert_not_nil @post.errors[:user]
		end

		test 'invalid without length title' do
			@post.title  = "qw"
			assert_not @post.valid?
		end
		test 'invalid without length description' do
			@post.description  = "qweasdzxc"
			assert_not @post.valid?
		end
	end

		class ParanoiaTest < PostTest
		test 'soft destroy' do
			@post.destroy
			assert @post.deleted? , 'post not hide after soft destroy'
		end
		test 'restore' do
			@post.destroy
			@post.restore
			assert_not @post.deleted?, 'post not restore after soft destroy'
		end
		test 'really_destroy' do
			@post.really_destroy!
			assert_not_includes User.all, @post, 'post not destory in database'
		end
	end

end
