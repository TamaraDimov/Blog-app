class CommentsController < ApplicationController
  def new
    @post = Post.includes(:comments).find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    @post = Post.includes(:comments).find(params[:post_id])
    @user = current_user
    @comment = @post.comments.build(author: @user, text: comments_params[:text])

    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'The comment is created'
    else
      redirect_to new_post_comment_path(@user, @post), alert: 'The comment was not created'
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:text)
  end
end
