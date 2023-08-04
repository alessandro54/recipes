# frozen_string_literal: true

# Service layer for days
class DaysService < ApplicationService
  include DayHelper

  def initialize(calendar:)
    @calendar = calendar
  end

  def generate_for(date: Date.today, **opts)
    days = calendar_days(with_images: opts[:with_images])
    generate_month(
      date:,
      days: days.from_date(
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

  def create(params)
    @calendar = Calendar.find(params.fetch(:calendar_id))
    @date = Date.parse(params.fetch(:when))

    Day.create(params)
  end

  private

  def calendar_days(with_images: false)
    if with_images
      calendar.days.includes(recipe: { image_attachment: :blob })
    else
      calendar.days
    end
  end

  attr_reader :calendar, :date
end
