class Api::V1::RecipeTypesController < Api::V1::ApiController
  def create
    @recipe_type = RecipeType.new(params.require(:recipe_type).permit(:name))
    if @recipe_type.save
      render json: @recipe_type, status: :created
    else
      render json: 'Não foi possível criar Tipo de Receita', status: :precondition_failed
    end
  end
end
