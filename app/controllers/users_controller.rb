class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.includes(:user)
  end
  
end
