class Post < ApplicationRecord
	extend FriendlyId
	include AASM
	friendly_id :title, use: [:slugged, :finders]
	acts_as_paranoid

	belongs_to :user

	validates_presence_of :title, :description, :user_id
	validates :title, length: { in: 3..100 }
	validates :description, length: { in: 10..1000 }

	before_destroy :update_user_count!

	def update_user_count!
		@user = self.user
		if @user.posted_post_count >= 1
			@user.decrement!(:posted_post_count)
		else
			@user.update(posted_post_count: 0)
		end
	end

	aasm do
		state :pending, initial: true
		state :posted

		event :published do
			transitions from: :pending, to: :posted

		end
		event :pending do
			transitions from: :posted, to: :pending
		end

	end

end
