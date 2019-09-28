class Api::V1::RecipeTypesController < Api::V1::ApiController
  def create
    @recipe_type = RecipeType.new(params.require(:recipe_type).permit(:name))
    if @recipe_type.save
      render json: @recipe_type, status: :created
    else
      render json: { msg: 'Erro ao criar tipo de receita',
                     error_type: @recipe_type.errors.full_messages },
             status: :precondition_failed
    end
  end
end
