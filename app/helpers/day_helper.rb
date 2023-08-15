# frozen_string_literal: true

# Helper to generate month days for the view
module DayHelper
  def calendar_days(days:, date: Date.today, starting_day: :monday)
    first = date.beginning_of_month.beginning_of_week(starting_day)
    last = date.end_of_month.end_of_week(starting_day)
    days_with_recipe = days.index_by(&:when)
    days = (first..last).map do |day|
      DayHelper.payload(day, date, days_with_recipe)
    end
    days.in_groups_of(7)
  end

  def self.payload(day, date, days_with_recipe)
    {
      date:  day,
      month: date.month,
      day:   days_with_recipe[day]
    }
  end

  def display_date(date)
    case date
    when Date.today
      'today'
    when Date.tomorrow
      'tomorrow'
    else
      date.strftime('%e %b')
    end
  end
end
