# frozen_string_literal: true

# Helper to generate month days for the view
module CalendarHelper
  def generate_month(date: Date.today, starting_day: :monday)
    first = date.beginning_of_month.beginning_of_week(starting_day)
    last = date.end_of_month.end_of_week(starting_day)
    (first..last).to_a.map do |d|
      { today: d == date, date: d, current_month: d.month == date.month }
    end.in_groups_of(7)
  end
end
