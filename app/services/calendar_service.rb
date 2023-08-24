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

  def save(calendar_params, user:)
    calendar = Calendar.create(calendar_params)

    assign_owner(calendar:, user:) if calendar.save

    calendar
  end

  def delete(calendar_id:, user:)
    calendar = Calendar.find(calendar_id)
    return if calendar.owners.count == calendar.delete_votes.count

    calendar.delete_votes << DeleteVote.create(calendar:, user:)
  end

  def assign_owners(calendar:, users:)
    return unless users.is_a?(Array)

    users.each do |user|
      next unless user.is_a?(User)

      assign_owner(calendar:, user:)
    end
  end

  def assign_owner(calendar:, user:)
    return unless user.is_a?(User)

    calendar.owners << user
  end
end
