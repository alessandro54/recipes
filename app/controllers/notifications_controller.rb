class NotificationsController < BaseController
  skip_before_action :authenticate_user!

  def create; end
end
