# frozen_string_literal: true

# Controller using turbo to change the calendar in the view
class CalendarsController < BaseController
  before_action :set_calendar, except: %i[index new create]
  before_action :set_date, only: :show

  def index
    @pagy, @calendars = pagy(
      calendar_service
      .list(user_id: current_user.id)
      .order(created_at: :desc),
      items: 9
    )
  end

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = calendar_service.save(calendar_params, user_id: current_user.id)
  end

  def show
    @days = day_service.list(
      calendar_id: calendar.id,
      month:       date.month,
      year:        date.year,
      with_images: true
    )
  end

  def destroy
    calendar_service.remove(calendar:)
  end

  private

  def calendar_params
    params.require(:calendar).permit(:title, :owner_id)
  end

  def set_calendar
    @calendar = calendar_service.find(id: params[:id])
    redirect_to calendars_path if @calendar.nil?
  end

  def set_date
    @date = params[:date].present? ? Date.parse(params[:date]) : Date.today
  end

  def day_service
    @day_service ||= DayService.new
  end

  def calendar_service
    @calendar_service ||= CalendarService.new
  end

  attr_reader :calendar, :date
end
