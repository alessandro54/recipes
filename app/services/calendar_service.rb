# frozen_string_literal: true

# Service layer for calendars
class CalendarService < ApplicationService
  def initialize(user:)
    @current_user = user
  end

  def find(id:)
    if id.present?
      check_ownership(Calendar.find_by(id:))
    else
      current_user.main_calendar
    end
  end

  def list
    current_user.calendars
  end

  def create(params)
    @calendar = Calendar.create(params)

    return unless @calendar.save

    @calendar.owners << current_user
    @calendar
  end

  def remove(calendar:)
    100.times { puts calendar.owners }
  end

  private

  def check_ownership(calendar)
    return calendar if current_user.owner?(calendar:)

    flash[:alert] = 'You are not an owner of that'
    redirect_to calendars_path
  end

  attr_reader :current_user
end
