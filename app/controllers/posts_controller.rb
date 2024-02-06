class PostsController < ApplicationController
  before_action :find_posts, only: %i[show edit update]

  def index
    @posts = Post.order(id: :desc)
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
      # 直接在这里给 @post 的 category_id 赋值是多余的，因为下面我们会直接赋值 category 对象
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
    @post.destroy
    redirect_to root_path, notice: '文章刪除成功'
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

end
