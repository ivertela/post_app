require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:alice)
    @user.update(avatar: File.open(Rails.root.join('test', 'fixtures', 'files', 'qwe.jpg') ))
    sign_in @user
  end

  class IndexActionTest < UsersControllerTest

    test 'authenticate user' do
      auth_user_redirect 'get', users_url
    end
    test 'should get index' do
      get users_url
      assert_response :success
    end
  end

  class CreateActionTest < UsersControllerTest

    test 'authenticate user' do
      post user_registration_url, params: {
        user: {
          email: 'zxc@zxc.zxc', name: 'Zxc',
          password: 'qweqwe', password_confirmation: 'qweqwe'
        }
      }
      assert_redirected_to root_url
      assert_equal "You are already signed in.", flash[:alert]
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
  end

  class ShowActionTest < UsersControllerTest

    test 'authenticate user' do
      auth_user_redirect 'get', user_url(@user)
    end

    test 'should show user' do
      get user_url(@user)
      assert_response :success
    end
  end

  class EditActionTest < UsersControllerTest

    test 'authenticate user' do
      sign_out @user
      get edit_user_registration_url(@user)
      assert_response 401
    end
    test 'should get edit' do
      get edit_user_registration_url(@user)
      assert_response :success
    end
  end

  class DestroyActionTest < UsersControllerTest

    test 'authenticate user' do
      auth_user_redirect 'post', user_soft_delete_url(user_id: @user.id)
      auth_user_redirect 'delete', user_url(@user)
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

  def auth_user_redirect(http_method , url)
    sign_out @user
    case http_method
    when 'get'
      get "#{url}"
    when 'post'
      post "#{url}"
    when 'patch'
      patch "#{url}"
    when 'delete'
      delete "#{url}"
    end
    assert_redirected_to new_user_session_url
  end

end
