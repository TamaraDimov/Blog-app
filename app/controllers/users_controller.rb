class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
    @post = Post.new
  end

  def show
    # @user = User.includes(:posts).find(params[:id])
    # @user_posts = @user.posts.includes(:comments)
    # render :show
    if params[:id] == "sign_out"
      sign_out_and_redirect
      else
        find_user
      end
end

  private

  def sign_out_and_redirect
    sign_out current_user
    redirect_to new_user_session_path
  end

  def find_user
    @user = User.find_by(id: params[:id])
    redirect_to users_path, alert: 'User not found' unless @user
  end
end
