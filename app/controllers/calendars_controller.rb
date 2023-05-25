# frozen_string_literal: true

# Controller using turbo to change the calendar in the view
class CalendarsController < BaseController
  include CalendarHelper

  def index
    render locals: {
      days: current_user.calendar.days.from_date
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

  def render_for_day(day = Date.today)
    render :change_month, locals: {
      day:,
      month: generate_month(
        date: day,
        days: current_user.calendar.days.from_date(
          day.year, day.month
        )
      )
    }
  end
end
