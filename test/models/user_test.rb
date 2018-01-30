require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = users(:valid)
		@user.update(avatar: File.open(Rails.root.join('test', 'fixtures', 'files', 'qwe.jpg') ))
	end

	test 'valid user' do
		assert @user.valid?
	end

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

	test 'invalid without avatar' do
		@user.update(avatar: file_fixture('qwe.jpg').open)
		assert @user.avatar.present?, 'no validation error for avatar present'
	end


	# test '#posts' do
	# 	assert_not_equal 0, @user.posts.size
	# end

	test 'paranoia test' do
		@user.destroy
		assert @user.deleted? , 'user not hide after soft destroy'
		@user.restore
		assert_not @user.deleted?, 'user not restore after soft destroy'
		@user.really_destroy!
		assert_not_includes User.all, @user, 'user not destory in database'
	end

	test 'email uniqueness' do
		@user.password = 987654
		@second_user = @user.dup
		assert_not @second_user.save
	end

end
