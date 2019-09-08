class RecipeTypesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :authorize_admin, only: %i[new create]

  def show
    @recipe_type = RecipeType.find(params[:id])
  end

  def new
    @recipe_type = RecipeType.new
  end

  def create
    @recipe_type = RecipeType.new(params.require(:recipe_type).permit(:name))
    if @recipe_type.save
        redirect_to @recipe_type
    else
      flash[:alert] = 'Não foi possível cadastrar Tipo de Receita'
      render :new
    end
  end

  def my_recipe_types
    @recipe_type = RecipeType.all
  end

  def authorize_admin
    redirect_to root_path unless current_user.admin
  end

end
