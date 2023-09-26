# frozen_string_literal: true

FactoryBot.define do
  factory :day do
    add_attribute(:when) { Faker::Date.between(from: 1.year.ago.to_date, to: Date.today) }
    calendar
    recipe
  end
end
