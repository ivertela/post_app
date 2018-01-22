class Post < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: [:slugged, :finders]
	validates_presence_of :title, :description
end
