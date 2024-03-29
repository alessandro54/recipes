# frozen_string_literal: true

class RecipesController < BaseController
  def index
    @pagy, @recipes = pagy(
      Recipe.with_photos.where(author: current_user),
      page:  params[:page],
      items: 10
    )
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end
end
