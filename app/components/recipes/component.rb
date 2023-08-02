# frozen_string_literal: true

module Recipes
  class Component < ApplicationComponent
    def initialize(recipe:)
      super
      @recipe = recipe
    end
  end
end
