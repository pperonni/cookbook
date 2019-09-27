# frozen_string_literal: true

require 'rails_helper'

feature 'Visit homepage' do
  scenario 'successfully' do
    user = create(:user)
    recipe_type = create(:recipe_type)
    cuisine = create(:cuisine)
    recipe = create(:recipe, recipe_type_id: recipe_type.id,
                             cuisine_id: cuisine.id,
                             user_id: user.id)

    visit root_path

    expect(page).to have_css('h1', text: 'CookBook')
    expect(page).to have_css('p', text:
                             'Bem-vindo ao maior livro de receitas online')

    expect(page).to have_css('h1', text: recipe.title)
    expect(page).to have_css('li', text: recipe.recipe_type.name)
    expect(page).to have_css('li', text: recipe.cuisine.name)
    expect(page).to have_css('li', text: recipe.difficulty)
    expect(page).to have_css('li', text: "#{recipe.cook_time} minutos")
  end
end
