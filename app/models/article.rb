class Article < ActiveRecord::Base

	# Includes
	include ReadOnlyModel
	extend FriendlyId
	acts_as_taggable

	# Pretty URLs
	friendly_id :title, use: :slugged

	# Table to read from
	self.table_name = "articles"

	# Relationships
	belongs_to :user

	# Search
	searchable do
	  text :title, boost: 5
	  text :content, boost: 3
   	text :tag_list, boost: 1
	  boolean :published
	  time :published_at
	end

end
