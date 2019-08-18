require 'rails_helper'

feature 'User register recipes' do
  scenario 'succesfully' do

    visit root_path
    click_on 'Cadastrar Receita'

    fill_in 'Título', with: 'Brigadeiro'
    fill_in 'Tipo de Receita', with: 'Sobremesa'
    fill_in 'Cozinha', with: 'Brasileira'
    fill_in 'Dificuldade', with: 'Fácil'
    fill_in 'Tempo de Preparo', with: '30'
    fill_in 'Ingredientes', with: 'Leite condensado, manteiga e chocolate em pó'
    fill_in 'Como Preparar', with: 'Misture tudo em uma panela, deixe no fogo enquanto mexe, até começar a desgrudar do fundo'
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
    visit root_path
    click_on 'Cadastrar Receita'

    fill_in 'Título', with: 'Brigadeiro'
    fill_in 'Tipo de Receita', with: 'Sobremesa'
    fill_in 'Cozinha', with: 'Brasileira'
    fill_in 'Tempo de Preparo', with: '30'
    fill_in 'Ingredientes', with: 'Leite condensado, manteiga e chocolate em pó'
    fill_in 'Como Preparar', with: 'Misture tudo em uma panela, deixe no fogo enquanto mexe, até começar a desgrudar do fundo'
    click_on 'Enviar'

    expect(page).to have_content('Você deve preencher todos os campos')
  end
end
