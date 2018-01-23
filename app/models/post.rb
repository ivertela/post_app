class Post < ApplicationRecord
	acts_as_paranoid
	belongs_to :user
	extend FriendlyId
	friendly_id :title, use: [:slugged, :finders]
	validates_presence_of :title, :description, :user_id
	before_destroy :update_user_count!

	def update_user_count!
		self.user.decrement!(:posted_post_count)
	end

	include AASM


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
