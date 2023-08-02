# frozen_string_literal: true

module Recipes
  module List
    class Component < ApplicationComponent
      include TimeHelper
      def initialize(recipes:, total_pages:)
        super
        @recipes = recipes
        @total_pages = total_pages
      end
    end
  end
end
