# frozen_string_literal: true

# Controller using turbo to change the calendar in the view
class CalendarsController < BaseController
  # before_action :set_calendar, except: :new

  def index
    calendar = current_user.main_calendar || current_user.calendars.first
    render locals: {
      days: calendar.days.includes(:recipe).from_date
    }
  end

  def new
    render locals: {
      calendar: Calendar.new
    }
  end

  def today
    render_for_day
  end

  def prev_month
    render_for_day(Date.parse(params[:day]).prev_month)
  end

  def next_month
    render_for_day(Date.parse(params[:day]).next_month)
  end

  private

  def set_calendar
    @calendars = params[:id].present? ? Calendar.find(params[:id]) : current_user.calendar
  rescue ActiveRecord::StatementInvalid
    redirect_to new_calendar_path
  end

  def render_for_day(day = Date.today)
    render :change_month, locals: { day:, month: calendar_service.generate_for_day(date: day) }
  end

  def calendar_service
    @calendar_service ||= DayService.new(calendar)
  end

  attr_reader :calendar
end
