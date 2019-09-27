# frozen_string_literal: true

require 'rails_helper'

feature 'Access recipe details' do
  scenario 'succesfullly' do
    user = create(:user)
    recipe_type = create(:recipe_type)
    cuisine = create(:cuisine)
    recipe = create(:recipe, recipe_type_id: recipe_type.id,
                             user_id: user.id,
                             cuisine_id: cuisine.id)
    visit root_path
    click_on 'Brigadeiro'

    expect(page).to have_css('h1', text: recipe.title)
    expect(page).to have_css('h3', text: 'Detalhes')
    expect(page).to have_css('p', text: recipe.recipe_type.name)
    expect(page).to have_css('p', text: recipe.cuisine.name)
    expect(page).to have_css('p', text: recipe.difficulty)
    expect(page).to have_css('p', text: "#{recipe.cook_time} minutos")
    expect(page).to have_css('h3', text: 'Ingredientes')
    expect(page).to have_css('p', text: recipe.ingredients)
    expect(page).to have_css('h3', text: 'Como Preparar')
    expect(page).to have_css('p', text: recipe.cook_method)
    expect(page).to have_css('p', text: 'Enviada por test@example.com')

    click_on 'Voltar'
    expect(current_path).to eq(root_path)
  end
end
