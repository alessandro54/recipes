# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    trait :with_username do
      username { Faker::Internet.username(separators: ['_']) }
    end

    trait :with_main_calendar do
      main_calendar { association(:calendar) }
    end

    trait :with_calendars do
      calendars { create_list(:calendar, 3) }
    end
  end
end
