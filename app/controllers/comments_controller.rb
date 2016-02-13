class CommentsController < ApplicationController
  layout 'public'

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to new_comment_path
    else      
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :content)
  end
end