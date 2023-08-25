class UsersController < ApplicationController
  def index
    @users = User.all
    @post = Post.new
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts.includes(:comments)
    render :show
  end
end
