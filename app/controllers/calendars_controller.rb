# frozen_string_literal: true

# Controller using turbo to change the calendar in the view
class CalendarsController < BaseController
  include CalendarHelper
  def index; end

  def today
    render_for(Date.today)
  end

  def prev_month
    render_for(Date.parse(params[:day]).prev_month)
  end

  def next_month
    render_for(Date.parse(params[:day]).next_month)
  end

  private

  def render_for(day)
    render :change_month, locals: {
      day:,
      month: generate_month(day)
    }
  end
end
