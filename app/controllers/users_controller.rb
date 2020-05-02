class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.includes(:user)
    @likes_count = Like.where(post_id: @posts.ids).count 
  end
  
end
