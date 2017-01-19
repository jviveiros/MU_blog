class CommentsController < ApplicationController

  def new
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new
    respond_to do |format|
      format.js{}
      format.html{}
    end

  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html{redirect_to article_path(@article)}
        format.js{}
      else
        format.html{render action: "new"}
        format.js{redirect_to article_path(@article)}
      end
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
