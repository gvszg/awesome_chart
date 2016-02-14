class Dashboard::PostsController < ApplicationController
  layout 'admin'
  before_action :find_post, only: %i(show edit update destroy switch_to_enable switch_to_disable)

  def index
    @posts = Post.recent
  end

  def new
    @post = Post.new
    # @post.category_ids = Category.all.map(&:id)
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to dashboard_posts_path
    else
      render :new
    end
  end

  def show
  end

  def edit    
  end

  def update    
    if @post.update(post_params)
      redirect_to dashboard_posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to dashboard_posts_path
  end

  def switch_to_enable
    @post.update_column(:status, 1)
    redirect_to dashboard_posts_path
  end

  def switch_to_disable
    @post.update_column(:status, 0)
    redirect_to dashboard_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :manager_id, category_ids: [])
  end

  def find_post
    @post = Post.find(params[:id])
  end
end