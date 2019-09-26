# frozen_string_literal: true

require 'rails_helper'

describe 'Register new recipe' do
  it 'succesfully' do
    user = User.create(email: 'email@email.com', password: '123456')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')

    post '/api/v1/recipe_types', params: { recipe: { title: 'Brigadeiro', recipe_type: recipe_type.id, user: user.id,
                                          cuisine: cuisine.id, difficulty: 'Fácil', cook_time: 30,
                                          ingredients: 'Leite condensado, manteiga e chocolate em pó',
                                          cook_method: 'Misture tudo em uma panela, deixe no fogo enquanto mexe, até começar a desgrudar do fundo' } }

    json_recipe = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 201
    expect(json_recipe[:title]).to eq 'Brigadeiro'
  end

  it 'and its blank' do
    post '/api/v1/recipe_types', params: { recipe: { title: '', difficulty: '', cook_time: '', ingredients: '', cook_method: '' } }

    expect(response.status).to eq 412
    expect(json_recipe_type[:msg]).to include('Não foi possível criar essa Receita')
    expect(json_recipe_type[:error_type]).to include("Title can't be blank")
  end
end
