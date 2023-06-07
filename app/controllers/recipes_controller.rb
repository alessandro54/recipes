# frozen_string_literal: true

class RecipesController < BaseController
  def index
    @recipes = Recipe.with_photos.where(author: current_user)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end
end
