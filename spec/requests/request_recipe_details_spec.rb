require 'rails_helper'

describe 'View recipe details' do
  it 'succesfully' do
    user = User.create(email: 'email@email.com', password: '123456')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    Recipe.create(title: 'Brigadeiro', recipe_type: recipe_type, user: user,
                  cuisine: cuisine, difficulty: 'Fácil', cook_time: 30,
                  ingredients: 'Leite condensado, manteiga e chocolate em pó',
                  cook_method: 'Misture tudo em uma panela, deixe no fogo enquanto mexe, até começar a desgrudar do fundo')

    get '/api/v1/recipes/1'

    json_recipe = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 200
    expect(json_recipe[:title]).to eq 'Brigadeiro'
    expect(json_recipe[:cook_time]).to eq 30
    expect(json_recipe[:difficulty]).to eq 'Fácil'
  end

  it 'and fails' do
    get '/api/v1/recipes/99'

    expect(response.status).to eq 404
    expect(response.body).to include('Receita não encontrada')
  end
end
