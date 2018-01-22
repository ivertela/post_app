class Post < ApplicationRecord
	acts_as_paranoid
	extend FriendlyId
	friendly_id :title, use: [:slugged, :finders]
	validates_presence_of :title, :description
end
