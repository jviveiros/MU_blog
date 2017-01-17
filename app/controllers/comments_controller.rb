class CommentsController < ApplicationController

  def new
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.user_id = current_user.id
      if @comment.save
        redirect_to article_path(@article)
      else
        redirect_to new_article_comment_path
      end
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @article = @comment.article
    if @comment.update_attributes(comment_params)
        redirect_to article_path(@article)
    else
        render action: "edit"
    end

  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @article

  end


  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end
