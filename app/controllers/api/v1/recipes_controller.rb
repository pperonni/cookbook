class Api::V1::RecipesController < Api::V1::ApiController

  def show
    @recipe = Recipe.find(params[:id])
    render json: @recipe, status: :ok

    rescue ActiveRecord::RecordNotFound
    render json: 'Receita não encontrada', status: :not_found
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      render json: @recipe, status: :created
    else
      render json: {msg: 'Não foi possível criar Receita', error_type: @recipe.errors.full_messages }, status: :precondition_failed
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id,
    :difficulty, :cook_time, :ingredients, :cook_method, :image)
  end

end
