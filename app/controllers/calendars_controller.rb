# frozen_string_literal: true

# Controller using turbo to change the calendar in the view
class CalendarsController < BaseController
  before_action :set_calendar, except: :new
  before_action :set_date, only: :show

  def index
    render locals: {
      calendars: calendars_service.all
    }
  end

  def new
    render locals: {
      calendar: Calendar.new
    }
  end

  def show
    render locals: {
      calendar:,
      date:,
      calendar_days: days_service.generate_for(date:)
    }
  end

  private

  def set_calendar
    @calendar = calendars_service.find(id: params[:id])
    redirect_to calendars_path if @calendar.nil?
  end

  def set_date
    @date = params[:date].present? ? Date.parse(params[:date]) : Date.today
  end

  def render_calendar(calendar_days, new_date = date)
    render :change_month, locals: {
      calendar:,
      date: new_date,
      calendar_days:
    }
  end

  def days_service
    @days_service ||= DaysService.new(calendar:)
  end

  def calendars_service
    @calendars_service ||= CalendarsService.new(user: current_user)
  end

  attr_reader :calendar, :date
end
