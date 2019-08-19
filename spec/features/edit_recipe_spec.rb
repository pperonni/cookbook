require 'rails_helper'

feature 'User update recipes' do
  scenario 'succesfully' do
    RecipeType.create(name: 'Sobremesa')
    recipe_type = RecipeType.create(name: 'Prato Principal')
    Recipe.create(title: 'Brigadeiro', recipe_type: recipe_type,
      cuisine: 'Francesa', difficulty: 'Difícil', cook_time: 130,
      ingredients: 'Leite condensado, manteiga e chocolate em pó',
      cook_method: 'Misture tudo em uma panela, deixe no fogo enquanto mexe, até começar a desgrudar do fundo')

    visit root_path
    click_on 'Brigadeiro'
    click_on 'Editar'

    select 'Sobremesa', from: 'Tipo de Receita'
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

  scenario 'must fill in all fields' do
    recipe_type = RecipeType.create(name: 'Sobremesa')
    Recipe.create(title: 'Brigadeiro', recipe_type: recipe_type,
      cuisine: 'Brasileira', difficulty: 'Fácil', cook_time: 30,
      ingredients: 'Leite condensado, manteiga e chocolate em pó',
      cook_method: 'Misture tudo em uma panela, deixe no fogo, enquanto mexe, até começar a desgrudar do fundo')

    visit root_path
    click_on 'Brigadeiro'
    click_on 'Editar'

    fill_in 'Título', with: ''
    fill_in 'Dificuldade', with: ''
    fill_in 'Tempo de Preparo', with: ''
    fill_in 'Ingredientes', with: ''
    fill_in 'Como Preparar', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você deve preencher todos os campos')
  end
end