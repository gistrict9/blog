class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  # GET /articles
  def index
    @search = Article.includes(:user, :tag_list).search do
      fulltext params[:search]

      with :published, true
      with(:published_at).less_than(Time.now)
      order_by :published_at, :desc
      paginate :page => params[:page], :per_page => 25
    end
    @articles = @search.results
  end

  # GET /articles/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.friendly.find(params[:id])
    end
end
