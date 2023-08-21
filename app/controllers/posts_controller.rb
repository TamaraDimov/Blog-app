class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @post = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end
end
