module MetaHelper

	# Page title
	def title(page_title)
	  content_for :title, page_title.to_s
	end

	# Page description
	def description(page_description)
	  content_for :description, page_description.to_s
	end

end