# frozen_string_literal: true

# Service layer for days
class DayService < ApplicationService
  def list_all(calendar_id: nil, **opts)
    calendar = calendar_service.find(id: calendar_id)
    days = calendar.days
    days = days.includes(recipe: {image_attachment: :blob}) if opts[:with_images] == true
    days
  end

  def list(calendar_id: nil, month: Date.today.month, year: Date.today.year, **)
    start_date = Date.new(year, month, 1)
    end_date = start_date.end_of_month
    list_all(calendar_id:, **).where(when: start_date..end_date)
  end

  def save(user_id: nil, **params)
    day = Day.new(params)
    user = User.find(user_id)

    return unless user.owner?(calendar: day.calendar)

    day if day.save
  end

  private

  def owner?(owner:, calendar:)
    owner.owner?(calendar:)
  end

  def calendar_service
    @calendar_service ||= CalendarService.new
  end
end
