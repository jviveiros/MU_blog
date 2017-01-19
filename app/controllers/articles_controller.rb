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
    respond_to do |format|
      format.js{}
      format.html{}
    end
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    respond_to do |format|
      if @article.save
        format.html{redirect_to article_url(@article)}
        format.js{}
      else
        format.html{render action: "new"}
        format.js{redirect_to root_path}
      end
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to article_path(@article)
    else
      render action: "edit"
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
