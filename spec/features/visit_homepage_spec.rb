# frozen_string_literal: true

require 'rails_helper'

feature 'Visit homepage' do
  scenario 'successfully' do
    user = User.create(email: 'email@email.com', password: '123456')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Brigadeiro', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Fácil', cook_time: 30, user: user,
                           ingredients: 'Leite condensado, manteiga e chocolate em pó',
                           cook_method: 'Misture tudo em uma panela, deixe no fogo, enquanto mexe, ' \
                           'até começar a desgrudar do fundo')

    visit root_path

    expect(page).to have_css('h1', text: 'CookBook')
    expect(page).to have_css('p', text: 'Bem-vindo ao maior livro de receitas online')

    expect(page).to have_css('h1', text: recipe.title)
    expect(page).to have_css('li', text: recipe.recipe_type.name)
    expect(page).to have_css('li', text: recipe.cuisine.name)
    expect(page).to have_css('li', text: recipe.difficulty)
    expect(page).to have_css('li', text: "#{recipe.cook_time} minutos")
  end
end
