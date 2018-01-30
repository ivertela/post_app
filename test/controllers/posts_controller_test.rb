require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  require 'sidekiq/testing'
  Sidekiq::Testing.fake!

  setup do
    @post = posts(:valid)
    @user = users(:alice)
    @user.update(avatar: File.open(Rails.root.join('test', 'fixtures', 'files', 'qwe.jpg') ))
    sign_in @user
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post posts_url, params: { post: { description: @post.description, title: @post.title } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    # @post.title = "Test title"
    # @post.description = "Test text"
    # patch post_url(@post), params: { post: { description: @post.description, title: @post.title } }
    # assert_redirected_to post_url(@post)
  end

  test "should destroy post" do
    Sidekiq::Testing.fake! do
      require 'sidekiq/testing'
      DeletePostWorker.jobs.clear
      delete post_url(@post)
      DeletePostWorker.perform_async(@post.id)
      # assert_delete_post_worker
      if DeletePostWorker.jobs.size > 0
        assert_not @post.deleted?
      else
        assert @post.deleted?
      end
    end
    
    assert_redirected_to posts_url
  end
end

