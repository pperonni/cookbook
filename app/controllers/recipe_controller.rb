class RecipeController < ApplicationController
  def index
    @recipe = Recipe.all
  end

  def show
    @recipe = Recipe.all
  end
end
