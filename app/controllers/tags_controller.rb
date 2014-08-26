class TagsController < ApplicationController

	# GET /tags
	def index
		@tags = ActsAsTaggableOn::Tag.order(name: :asc)
	end

	# GET /tags/:tag
	def show
		@tag = params[:tag].to_s
		@articles = Article.tagged_with(params[:tag]).order(published_at: :desc).page(params[:page]).per(25)
	end

end
