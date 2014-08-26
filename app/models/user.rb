class User < ActiveRecord::Base

	# Includes
	include ReadOnlyModel

	# Table to read from
	self.table_name = "users"

	# Relationships
	has_many :articles

	# Methods
	def full_name
		first_name + " " + last_name
	end

end
