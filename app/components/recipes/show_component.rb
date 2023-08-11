# frozen_string_literal: true

module Recipes
  class ShowComponent < ApplicationComponent
    def initialize(recipe:)
      @recipe = recipe
    end
  end
end
