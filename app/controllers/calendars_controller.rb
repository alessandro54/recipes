# frozen_string_literal: true

# Controller using turbo to change the calendar in the view
class CalendarsController < BaseController
  before_action :set_calendar, except: %i[index new create]
  before_action :set_date, only: :show

  def index
    @calendars = calendars_service.all
  end

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.new(calendar_params)

    calendars_service.create(calendar_params)
    return unless @calendar.save

    @calendar.owners << current_user

    respond_to(&:turbo_stream)
  end

  def show
    @calendar_days = days_service.generate_for(date:)
  end

  def destroy
    calendar_service.remove(calendar:)
  end

  private

  def calendar_params
    params.require(:calendar).permit(:title)
  end

  def set_calendar
    @calendar = calendars_service.find(id: params[:id])
    redirect_to calendars_path if @calendar.nil?
  end

  def set_date
    @date = params[:date].present? ? Date.parse(params[:date]) : Date.today
  end

  def days_service
    @days_service ||= DaysService.new(calendar:)
  end

  def calendars_service
    @calendars_service ||= CalendarsService.new(user: current_user)
  end

  attr_reader :calendar, :date
end
