# frozen_string_literal: true

# Service layer for days
class DaysService
  include DayHelper

  def initialize(calendar:)
    @calendar = calendar
  end

  def generate_for(date: Date.today)
    generate_month(
      date:,
      days: calendar.days.includes(recipe: { image_attachment: :blob }).from_date(
        date.year, date.month
      )
    )
  end

  def prev_month(date)
    generate_for(date: date.prev_month)
  end

  def next_month(date)
    generate_for(date: date.next_month)
  end

  attr_reader :calendar, :date
end
