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

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
