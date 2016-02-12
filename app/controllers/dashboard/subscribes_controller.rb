class Dashboard::SubscribesController < DashboardController
  layout 'admin'

  def index
    @subscribes = Subscribe.recent
  end
end