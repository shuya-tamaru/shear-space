class UsersController < ApplicationController
  before_action :authenticate_user! , except: [:index,:show]

  def index
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.includes(:user)
    @likes_count = Like.where(post_id: @posts.ids).count 
  end
  
end
