# frozen_string_literal: true

require 'open-uri'

FactoryBot.define do
  factory :recipe do
    title { Faker::Food.dish }
    description { Faker::Food.description }
    duration { rand(12..40) * 10 }
    steps { Array.new(8) { Faker::Lorem.sentence } }
    ingredients { Array.new(4) { Faker::Food.unique.ingredient } }

    transient do
      image_path { Faker::LoremFlickr.image(size: '500x300', search_terms: %w[dish food]) }
    end

    author factory: %i[user]

    after(:create) do |recipe, evaluator|
      recipe.image.attach(io:           URI.parse(evaluator.image_path).open,
                          filename:     'recipe_image.jpg',
                          content_type: 'image/jpeg')
    end
  end
end
