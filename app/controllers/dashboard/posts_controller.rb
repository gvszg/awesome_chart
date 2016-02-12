class Dashboard::PostsController < ApplicationController
  layout 'admin'

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    # @post.category_ids = Category.all.map(&:id)
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :manager_id, category_ids: [])
  end
end