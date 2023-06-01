# frozen_string_literal: true

# Helper to generate month days for the view
module CalendarHelper
  # Adapt grid rows depending on days form
  def adaptive_styles(length)
    case length
    when 7
      'grid-rows-7'
    when 6
      'grid-rows-6'
    when 5
      'grid-rows-5'
    else
      'grid-rows-4'
    end
  end
end
