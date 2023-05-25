# frozen_string_literal: true

# Helper to generate month days for the view
module CalendarHelper
  def generate_month(days:, date: Date.today, starting_day: :monday)
    first = date.beginning_of_month.beginning_of_week(starting_day)
    last = date.end_of_month.end_of_week(starting_day)
    dates_with_recipe = days.pluck(:when)
    (first..last).to_a.map do |d|
      recipe = days.find_by(when: date).try(:recipe) if dates_with_recipe.include?(d)
      { today: d == date, date: d, current_month: d.month == date.month, recipe: }
    end.in_groups_of(7)
  end
end
