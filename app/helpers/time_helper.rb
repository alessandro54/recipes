# frozen_string_literal: true

module TimeHelper
  def minutes_to_hours_and_minutes(minutes)
    hours, remaining_minutes = minutes.divmod(60)
    display_hours = hours > 1 ? "#{hours}h" : ''
    display_minutes = remaining_minutes > 1 ? "#{remaining_minutes}m" : ''

    "#{display_hours} #{display_minutes}"
  end
end
