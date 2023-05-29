# frozen_string_literal: true

# Root controller
class DashboardsController < BaseController
  def index
    if (@calendar = current_user.main_calendar)
      render locals: {
        calendar_days: days_service.for_today
      }
    else
      redirect_to calendars_path
    end
  end

  def days_service
    @days_service ||= DaysService.new(calendar:)
  end

  attr_reader :calendar
end
