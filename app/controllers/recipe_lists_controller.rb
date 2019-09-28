class RecipeListsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def show
    @recipe_list = RecipeList.find(params[:id])
  end

  def new
    @recipe_list = RecipeList.new
  end

  def create
    @recipe_list = RecipeList.new(params.require(:recipe_list).permit(:name))
    @recipe_list.user = current_user
    if @recipe_list.save
      redirect_to @recipe_list
    else
      flash[:alert] = 'Não foi possível criar nova Lista'
      render :new
    end
  end

  def mylists
    @recipe_list = current_user.recipe_lists
  end
end
