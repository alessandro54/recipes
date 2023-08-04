# frozen_string_literal: true

# Controller using turbo to change the calendar in the view
class CalendarsController < BaseController
  before_action :set_calendar, except: %i[index new create]
  before_action :set_date, only: :show

  def index
    @calendars = calendar_service.list
  end

  def create
    @calendar = calendar_service.create(calendar_params)

    return unless @calendar

    respond_to(&:turbo_stream)
  end

  def show
    @calendar_days = day_service.generate_for(date:)
  end

  def destroy
    calendar_service.remove(calendar:)
  end

  private

  def calendar_params
    params.require(:calendar).permit(:title)
  end

  def set_calendar
    @calendar = calendar_service.find(id: params[:id])
    redirect_to calendars_path if @calendar.nil?
  end

  def set_date
    @date = params[:date].present? ? Date.parse(params[:date]) : Date.today
  end

  def day_service
    @day_service ||= DayService.new(calendar:)
  end

  def calendar_service
    @calendar_service ||= CalendarService.new(user: current_user)
  end

  attr_reader :calendar, :date
end
