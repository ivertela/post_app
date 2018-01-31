require 'test_helper'
class DeletePostWorkerTest < MiniTest::Unit::TestCase

	def perform(post_id)
		Post.find(post_id).destroy
	end
end
