class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
    @post = Post.new
  end

  def show
    @user = User.includes(:posts).find(params[:id])
    @user_posts = @user.posts.includes(:comments)
    render :show
  end
end
