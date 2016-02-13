class PostsController < ApplicationController
  layout 'public'

  def index
    @posts = Post.enable.recent
  end

  def show
    @post = Post.enable.find(params[:id])
  end
end