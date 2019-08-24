class RecipesController < ApplicationController
  before_action :find_recipe, only: %i[show edit update]
  before_action :authenticate_user!, only: %i[new create edit update]

  def index
    @recipe = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
    @recipe_type = RecipeType.all
    @cuisine = Cuisine.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to @recipe
    else
      flash[:alert] = 'Não foi possível cadastrar Receita'
      @recipe_type = RecipeType.all
      @cuisine = Cuisine.all
      render :new
    end
  end

  def edit
    if current_user && current_user == @recipe.user
      @recipe_type = RecipeType.all
      @cuisine = Cuisine.all
    else
      return_to root_path
    end
  end

  def update
      if @recipe.update(recipe_params)
        redirect_to @recipe
      else
        flash[:alert] = 'Não foi possível cadastrar Receita'
        @recipe_type = RecipeType.all
        @cuisine = Cuisine.all
        render :edit
      end
  end

  def search
    @recipe = Recipe.where('title LIKE ?', "%#{params[:search_for]}%")

    if @recipe.empty?
      flash[:alert] = 'Nenhuma Receita encontrada'
    end
  end

  def myrecipes
    @recipe = current_user.recipes
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id,
      :difficulty, :cook_time, :ingredients, :cook_method)
  end
end
