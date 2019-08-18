class RecipesController < ApplicationController
  before_action :find_recipe, only: %i[show edit update]

  def index
    @recipe = Recipe.all
  end

  def show

  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end


  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type, :cuisine,
      :difficulty, :cook_time, :ingredients, :cook_method)
  end
end
