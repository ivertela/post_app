require 'test_helper'
class DeletePostWorkerTest < MiniTest::Unit::TestCase
	require 'sidekiq/testing'
	Sidekiq::Testing.fake!

	def perform(post_id)
		Post.find(post_id).destroy
	end
end
