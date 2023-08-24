# frozen_string_literal: true

FactoryBot.define do
  factory :follow do
    follower factory: %i[user]
    calendar
  end
end
