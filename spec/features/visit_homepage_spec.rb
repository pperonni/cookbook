require 'rails_helper'

feature 'Visit homepage' do
  scenario 'successfully' do
    recipe = Recipe.create(title: 'Brigadeiro', recipe_type: 'Sobremesa',
      cuisine: 'Brasileira', difficulty: 'Fácil', cook_time: 30)

    visit root_path

    expect(page).to have_css('h1', text:'CookBook')
    expect(page).to have_css('p', text:'Bem-vindo ao maior livro de receitas online')

    expect(page).to have_css('h1', text: recipe.title)
    expect(page).to have_css('li', text: recipe.recipe_type)
    expect(page).to have_css('li', text: recipe.cuisine)
    expect(page).to have_css('li', text: recipe.difficulty)
    expect(page).to have_css('li', text: "#{recipe.cook_time} minutos")
  end
end
