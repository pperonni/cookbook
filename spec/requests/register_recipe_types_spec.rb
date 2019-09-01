require 'rails_helper'

describe 'Regiter recipe type' do
  it 'succesfully' do

    post '/api/v1/recipe_types', params: {recipe_type: {name: 'Sobremesa'}, cuisine: {name: 'Brasileira'}}

    json_recipe_type = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 201
    expect(json_recipe_type[:name]).to eq 'Sobremesa'
  end
end
