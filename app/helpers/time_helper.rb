# frozen_string_literal: true

module TimeHelper
  def minutes_to_hours_and_minutes(minutes)
    hours, remaining_minutes = minutes.divmod(60)
    display_hours = hours > 1 ? hours.to_s + ' hour'.pluralize(hours) : ''
    display_minutes = remaining_minutes > 1 ? remaining_minutes.to_s + ' min'.pluralize(remaining_minutes) : ''

    "#{display_hours} #{display_minutes}"
  end
end
