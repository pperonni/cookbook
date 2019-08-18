require 'rails_helper'

feature 'User edit recipes' do
  scenario 'succesfully' do
    recipe = Recipe.create(title: 'Brigadeiro', recipe_type: 'Sobremesa',
      cuisine: 'Francesa', difficulty: 'Difícil', cook_time: 130,
      ingredients: 'Leite condensado, manteiga e chocolate em pó',
      cook_method: 'Misture tudo em uma panela, deixe no fogo enquanto mexe, até começar a desgrudar do fundo')

    visit root_path
    click_on recipe.title
    click_on 'Editar'

    fill_in 'Cozinha', with: 'Brasileira'
    fill_in 'Dificuldade', with: 'Fácil'
    fill_in 'Tempo de Preparo', with: 30
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Brigadeiro')
    expect(page).to have_css('h3', text: 'Detalhes')
    expect(page).to have_css('p', text: 'Sobremesa')
    expect(page).to have_css('p', text: 'Brasileira')
    expect(page).to have_css('p', text: 'Fácil')
    expect(page).to have_css('p', text: "30 minutos")
    expect(page).to have_css('h3', text: 'Ingredientes')
    expect(page).to have_css('p', text: 'Leite condensado, manteiga e chocolate em pó')
    expect(page).to have_css('h3', text: 'Como Preparar')
    expect(page).to have_css('p', text: 'Misture tudo em uma panela, deixe no fogo enquanto mexe, até começar a desgrudar do fundo')
  end
end
