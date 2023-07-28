class NotificationsController < BaseController
  skip_before_action :authenticate_user!

  def create
    puts params
  end
end
