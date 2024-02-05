class PostsController < ApplicationController
  before_action :find_posts, only: %i[show edit update]

  def index
    @posts = Post.order(id: :desc)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: '文章建立成功'
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to root_path, notice: '文章編輯成功'
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
    params.require(:post).permit(:title, :subtitle, :body)
  end

end
