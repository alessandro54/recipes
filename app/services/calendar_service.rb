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

  def delete(calendar:, user:)
    raise ActiveRecord::RecordNotFound if calendar.discarded?

    calendar.discard if deletable?(calendar)

    create_delete_vote(calendar, user)
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

  private

  def deletable?(calendar)
    calendar.owners.count <= calendar.delete_votes.count + 1
  end

  def create_delete_vote(calendar, user)
    delete_vote = Calendar::DeleteVote.create(calendar:, user:)
    calendar.delete_votes << delete_vote
    delete_vote
  end
end
