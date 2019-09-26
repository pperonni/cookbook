# frozen_string_literal: true

require 'rails_helper'

describe 'Regiter recipe type' do
  it 'succesfully' do
    post '/api/v1/recipe_types', params: { recipe_type: { name: 'Sobremesa' } }

    json_recipe_type = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 201
    expect(json_recipe_type[:name]).to eq 'Sobremesa'
  end

  it 'and its blank' do
    post '/api/v1/recipe_types', params: { recipe_type: { name: '' } }

    json_recipe_type = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 412
    expect(json_recipe_type[:msg]).to include('Não foi possível criar esse tipo de receita')
    expect(json_recipe_type[:error_type]).to include("Name can't be blank")
  end
end
