class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find_by(id: params[:id])
    @comments = @article.comments
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
      if @article.save
        redirect_to article_url(@article)
      else
        redirect_to "articles#new"
      end
  end

  def destroy
    @article = Article.find_by(id: params[:id])
    @article.destroy
    redirect_to root_path

  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :user_id)
  end

end
