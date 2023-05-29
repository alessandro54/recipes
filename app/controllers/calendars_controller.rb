# frozen_string_literal: true

# Controller using turbo to change the calendar in the view
class CalendarsController < BaseController
  before_action :set_calendar, except: :new
  before_action :set_date, only: %i[prev_month next_month]

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
      calendar_days: days_service.for_today
    }
  end

  def today
    render :change_month, locals: {
      calendar:,
      date:,
      calendar_days: days_service.for_today
    }
  end

  def prev_month
    render :change_month, locals: {
      calendar:,
      date: date.prev_month,
      calendar_days: days_service.prev_month(date)
    }
  end

  def next_month
    render :change_month, locals: {
      calendar:,
      date: date.next_month,
      calendar_days: days_service.next_month(date)
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

  def days_service
    @days_service ||= DaysService.new(calendar:)
  end

  def calendars_service
    @calendars_service ||= CalendarsService.new(user: current_user)
  end

  attr_reader :calendar, :date
end
