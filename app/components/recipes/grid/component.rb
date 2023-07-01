# frozen_string_literal: true

module Recipes
  module Grid
    class Component < ApplicationComponent
      def initialize(recipes:)
        super
        @recipes = recipes
      end
    end
  end
end

