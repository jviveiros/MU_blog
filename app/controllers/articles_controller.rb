class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find_by(params[:id])
  end

  def new
    @article = Article.new
  end

end
