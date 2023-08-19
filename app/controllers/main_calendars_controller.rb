# frozen_string_literal: true

class MainCalendarsController < BaseController
  before_action :set_date

  def index
    redirect_to calendars_path and return unless current_user.calendars.count.positive?

    set_main_calendar
    @days = day_service.list(
      calendar_id: calendar.id,
      month:       date.month,
      year:        date.year,
      with_images: true
    )
  end

  private

  def set_date
    @date = params[:date].present? ? Date.parse(params[:date]) : Date.today
  end

  def set_main_calendar
    @calendar = current_user.main_calendar
  end

  def day_service
    @day_service ||= DayService.new
  end

  attr_reader :calendar, :date
end
