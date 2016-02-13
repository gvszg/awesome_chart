class PostsController < ApplicationController
  layout 'public'

  def index
    @posts = Post.enable.recent
  end

  def show
    @post = Post.enable.find(params[:id])
    set_page_title "#{@post.title}"
    @page_description =  view_context.truncate(@post.description, :length => 100 )
  end
end