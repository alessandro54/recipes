# frozen_string_literal: true

require 'open-uri'

FactoryBot.define do
  factory :recipe do
    title { Faker::Food.dish }
    description { Faker::Food.description }
    steps { Array.new(8) { Faker::Lorem.sentence } }
    ingredients { Array.new(4) { Faker::Food.unique.ingredient } }
    transient do
      image { Faker::LoremFlickr.image(size: '500x300', search_terms: %w[dish food]) }
    end
    association :author, factory: :user

    after(:build) do |image, evaluator|
      image.image.attach(
        io: URI.open(evaluator.image),
        filename: 'image.jpg',
        content_type: 'image/jpeg'
      )
    end
  end
end
