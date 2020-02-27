class PostsController < ApplicationController

  def index
  end
  
  def new
    @post = Post.new()
  end

  def create
    @post = Post.create(post_params)
    @post.save!
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id)
  end

end
