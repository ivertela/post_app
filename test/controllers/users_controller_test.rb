require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:alice)
    @user.update(avatar: File.open(Rails.root.join('test', 'fixtures', 'files', 'qwe.jpg') ))
    sign_in @user
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  # test "should get new" do
  #   get new_user_url
  #   assert_response :success
  # end

  # test "should create user" do
  #   assert_difference('User.count') do
  #     post users_url, params: { 
  #       user: { 
  #         email: "zxc@zxc.zxc", name: "Zxc", 
  #         encrypted_password: Devise::Encryptor.digest(User, "12345678"),
  #         avatar: File.open(Rails.root.join('test', 'fixtures', 'files', 'qwe.jpg') ) 
  #       } 
  #     }
  #   end
  #   assert_redirected_to user_url(User.last)
  # end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  # test "should get edit" do
  #   get edit_user_url(@user)
  #   assert_response :success
  # end

  # test "should update user" do
  #    patch user_url(@user), params: { user: {  } }
  #    assert_redirected_to user_url(@user)
  # end

  # test "should destroy user" do
  #   assert_difference('User.count', -1) do
  #     delete user_url(@user)
  #   end

  #   assert_redirected_to users_url
  # end
end
