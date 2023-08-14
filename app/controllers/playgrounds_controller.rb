# frozen_string_literal: true

# This is a playground controller, it's not meant to be used in production
class PlaygroundsController < BaseController
  def show
    flash[:simple_info] = 'This is a simple info message'
    flash[:simple_warn] = 'This is a simple warn message'

    @service = day_service.list(calendar_id: params[:calendar_id])
  end

  def day_service
    @day_service ||= DayService.new(calendar: current_user)
  end
end
