# frozen_string_literal: true

# Service layer for calendars
class CalendarService < ApplicationService
  def list_all
    Calendar.all
  end

  def find(id:)
    Calendar.find(id)
  rescue ActiveRecord::RecordNotFound
    current_user.main_calendar
  end

  def list(user_id: nil)
    User.find(user_id).calendars
  end

  def save(calendar_params, user_id: nil)
    calendar = Calendar.create(calendar_params)

    calendar.owners << User.find(user_id) if calendar.save

    calendar
  end
end
