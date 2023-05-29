# frozen_string_literal: true

# Helper to generate month days for the view
module DayHelper
  def generate_month(days:, date: Date.today, starting_day: :monday)
    first = date.beginning_of_month.beginning_of_week(starting_day)
    last = date.end_of_month.end_of_week(starting_day)
    days_with_recipe = days.index_by(&:when)
    (first..last).map do |day|
      DayHelper.payload(day, date, days_with_recipe)
    end.in_groups_of(7)
  end

  def self.payload(day, date, days_with_recipe)
    {
      id: days_with_recipe[day]&.id,
      today: day == date,
      date: day,
      current_month: day.month == date.month,
      recipe: days_with_recipe[day]&.recipe
    }
  end
end
