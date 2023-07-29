# frozen_string_literal: true

# Service layer for calendars
class CalendarsService
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

  def all
    current_user.calendars
  end

  def create(params)
    return params
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
