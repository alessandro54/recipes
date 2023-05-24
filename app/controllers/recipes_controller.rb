# frozen_string_literal: true

class RecipesController < BaseController
  def index
    @recipes = []
  end

  def new
    recipe = []
    render :new, recipe:
  end
end
