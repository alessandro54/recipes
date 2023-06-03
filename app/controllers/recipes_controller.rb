# frozen_string_literal: true

class RecipesController < BaseController
  def index
    recipes = Recipe.with_photos.where(author: current_user)
    render locals: {
      recipes:,
      mode: params.fetch(:mode, 'grid')
    }
  end

  def show
    recipe = Recipe.find(params[:id])
    render locals: {
      recipe:
    }
  end

  def new
    recipe = []
    render :new, recipe:
  end
end
