require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = users(:valid)
	end

	class ValidUserTest < UserTest
		test 'invalid without name' do
			@user.name = nil
			refute @user.valid?, 'user is valid without a name'
			assert_not_nil @user.errors[:name], 'no validation error for name present'
		end

		test 'invalid without email' do
			@user.email = nil
			refute @user.valid?
			assert_not_nil @user.errors[:email], 'no validation error for email present'
		end
		test 'email uniqueness' do
			duplicate_user = @user.dup
			assert_not duplicate_user.valid?
		end
	end

	class ParanoiaTest < UserTest
		test 'soft destroy' do
			@user.destroy
			assert @user.deleted? , 'user not hide after soft destroy'
		end
		test 'restore' do
			@user.destroy
			@user.restore
			assert_not @user.deleted?, 'user not restore after soft destroy'
		end
		test 'really_destroy' do
			@user.really_destroy!
			assert_not_includes User.all, @user, 'user not destory in database'
		end
	end

end
