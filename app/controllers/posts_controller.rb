class PostsController < ApplicationController
  before_action :find_posts, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show about]
  before_action :check_admin, only: %i[new create edit update destroy]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).order(created_at: :desc).page(params[:page])
  end

  def show
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    category = nil

    if params[:category] && params[:category][:name].present?
      category = Category.find_or_create_by(name: params[:category][:name])
    end
    
    @post = Post.new(post_params)
    @post.category = category if category.present?

    if @post.save
      redirect_to root_path, notice: '文章已儲存'
    else
      @categories = Category.all
      render :new
    end
  end
  
  def edit
    @categories = Category.all
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: '文章編輯成功'
    else
      render :edit
    end
  end

  def destroy
    @post.delete
    redirect_to root_path, notice: '文章刪除成功'
  end

  def about
  end

  private

  def find_posts
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :subtitle, :body, :deleted_at, :category_id)
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def check_admin
    unless current_user.admin?
      redirect_to root_path, alert: "只有管理員可以進行這項操作。"
    end
  end

end
