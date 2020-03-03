class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(8)
  end
  
  def new
    @post = Post.new()
  end

  def create
    @post = Post.create(post_params)
    @post.save!
    redirect_to root_path, notice: "投稿しました"
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to root_path, notice: "更新しました"
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path, notice: "消去しました"
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :category_id).merge(user_id: current_user.id)
  end

end
