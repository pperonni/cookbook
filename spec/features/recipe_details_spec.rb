require 'rails_helper'

feature 'Access recipe details' do
  scenario 'succesfullly' do
    recipe = Recipe.create(title: 'Brigadeiro', recipe_type: 'Sobremesa',
      cuisine: 'Brasileira', difficulty: 'Fácil', cook_time: 30,
      ingredients: 'Leite condensado, manteiga e chocolate em pó', cook_method: 'Misture tudo em uma panela, deixe no fogo enquanto mexe, até começar a desgrudar do fundo')

    visit root_path
    click_on recipe.title

    expect(page).to have_css('h1', text: recipe.title)
    expect(page).to have_css('h3', text: 'Detalhes')
    expect(page).to have_css('p', text: recipe.recipe_type)
    expect(page).to have_css('p', text: recipe.cuisine)
    expect(page).to have_css('p', text: recipe.difficulty)
    expect(page).to have_css('p', text: "#{recipe.cook_time} minutos")
    expect(page).to have_css('h3', text: 'Ingredientes')
    expect(page).to have_css('p', text: recipe.ingredients)
    expect(page).to have_css('h3', text: 'Como Preparar')
    expect(page).to have_css('p', text: recipe.cook_method)

    click_on 'Voltar'
    expect(current_path).to eq(root_path)
  end
end
