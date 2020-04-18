class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show, :update, :destroy]
  before_action :move_to_signin, except: [:index,:show, :search, :search_category] 

  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(8)
  end
  
  def new
      @post = Post.new()
      @post.images.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to root_path, notice: "投稿しました"
    else
      redirect_to new_post_path, notice: "未入力の項目があります"
    end

  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @like = Like.new
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to root_path, notice: "更新しました"
    else
      redirect_to edit_post_path, notice: "未入力の項目があります"

    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: "消去しました"
  end

  def search
    @posts = Post.search(params[:keyword]).includes(:user).order("created_at DESC").page(params[:page]).per(8)
  end

  def search_category
    @category = Category.find(params[:category_id])
    @posts = @category.posts.includes(:user).order("created_at DESC").page(params[:page]).per(8)
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :category_id, images_attributes: [:id, :image, :_destroy]).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_signin
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
