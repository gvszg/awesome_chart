class Dashboard::CommentsController < DashboardController
  layout 'admin'

  def index
    @comments = Comment.recent
  end
end