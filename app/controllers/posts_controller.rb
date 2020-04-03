class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, only: [:create]
  
  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(8)
  end
  
  def new
    @post = Post.new()
    @post.images.new
  end

  def create
    @post = Post.create(post_params)
    @post.save!
    redirect_to root_path, notice: "投稿しました"
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @like = Like.new
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to root_path, notice: "更新しました"
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: "消去しました"
  end

  def search
    @posts = Post.search(params[:keyword]).includes(:user).order("created_at DESC").page(params[:page]).per(8)
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :category_id, images_attributes: [:id, :image, :_destroy]).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
