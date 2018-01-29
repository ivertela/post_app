require 'test_helper'

class PostTest < ActiveSupport::TestCase
	def setup
		@post = posts(:valid)
	end

	test 'post valid' do
		assert @post.valid?
	end

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
end
