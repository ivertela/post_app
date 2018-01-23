class Post < ApplicationRecord
	belongs_to :user
	acts_as_paranoid
	extend FriendlyId
	friendly_id :title, use: [:slugged, :finders]
	validates_presence_of :title, :description, :user_id
end
