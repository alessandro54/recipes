# frozen_string_literal: true

module Recipes
  module Index
    class Component < ApplicationComponent
      def initialize(recipe:)
        @recipe = recipe
      end
    end
  end
end
