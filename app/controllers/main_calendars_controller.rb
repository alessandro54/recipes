class MainCalendarsController < BaseController
  before_action :set_date

  def index
    unless current_user.calendars.count.positive?
      redirect_to calendars_path and return
    end
    set_main_calendar
    @calendar_days = days_service.generate_for(date:)
  end

  private

  def set_date
    @date = params[:date].present? ? Date.parse(params[:date]) : Date.today
  end

  def set_main_calendar
    @calendar = current_user.main_calendar
  end

  def days_service
    @days_service ||= DayService.new(calendar: @calendar)
  end

  attr_reader :calendar, :date
end
