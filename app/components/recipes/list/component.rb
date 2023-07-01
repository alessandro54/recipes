# frozen_string_literal: true

module Recipes
  module List
    class Component < ApplicationComponent
      include TimeHelper
      def initialize(recipes:)
        super
        @recipes = recipes
      end
    end
  end
end
