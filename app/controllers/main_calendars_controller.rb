class MainCalendarsController < BaseController
  before_action :set_date

  def index
    redirect_to calendars_path unless (@calendar = current_user.main_calendar)
    @calendar_days = days_service.generate_for(date:)
  end

  private

  def set_date
    @date = params[:date].present? ? Date.parse(params[:date]) : Date.today
  end

  def days_service
    @days_service ||= DaysService.new(calendar:)
  end

  attr_reader :calendar, :date
end
