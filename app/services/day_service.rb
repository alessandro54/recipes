# frozen_string_literal: true

class DayService
  include CalendarHelper

  def initialize(calendar)
    @calendar = calendar
  end

  def generate_for_day(date: Date.today)
    generate_month(
      date:,
      days: @calendar.days.includes(:recipe).from_date(
        date.year, date.month
      )
    )
  end

  def prev_month(date)
    generate_for_day(date: Date.parse(date).prev_month)
  end

  def next_month(date)
    generate_for_day(date: Date.parse(date).next_month)
  end
end
