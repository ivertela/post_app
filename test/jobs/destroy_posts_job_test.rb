require 'test_helper'

class DestroyPostsJobTest < ActiveJob::TestCase

  def perform(post_id)
    Post.find(post_id).destroy
  end

end
