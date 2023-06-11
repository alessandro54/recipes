# frozen_string_literal: true

FactoryBot.define do
  factory :calendar do
    title { Faker::Lorem.sentence }

    trait :with_owners do
      owners { create_list :user, 3 }
    end

    trait :with_followers do
      followers { create_list :user, 3 }
    end
  end
end
