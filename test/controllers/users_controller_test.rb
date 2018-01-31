require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:alice)
    @user.update(avatar: File.open(Rails.root.join('test', 'fixtures', 'files', 'qwe.jpg') ))
    sign_in @user
  end

  test 'should get index' do
    get users_url
    assert_response :success
  end

  test 'should create user' do
    sign_out(@user)
    assert_difference('User.count') do
      post user_registration_url, params: {
        user: {
          email: 'zxc@zxc.zxc', name: 'Zxc',
          password: 'qweqwe', password_confirmation: 'qweqwe'
        }
      }
    end
    assert_redirected_to root_url
  end

  test 'should show user' do
    get user_url(@user)
    assert_response :success
  end

  test 'should get edit' do
    get edit_user_registration_url(@user)
    assert_response :success
  end

  test 'should destroy user' do
    post user_soft_delete_url(user_id: @user.id)
    @user.reload
    assert @user.deleted?, 'soft destroy not work'
    @user.restore
    @user.reload
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end
    assert_redirected_to users_url
  end
end
