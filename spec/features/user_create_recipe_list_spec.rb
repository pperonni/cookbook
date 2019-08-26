require 'rails_helper'

feature 'User create recipe lists' do
  scenario 'succesfully' do
    user = User.create(email: 'email@email.com', password: '123456')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'entrar'

    click_on 'Criar Listas de Receitas'
    fill_in 'Nome', with: 'Sobremesas de Domingo'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Sobremesas de Domingo')
  end

  scenario 'succesfully' do
    user = User.create(email: 'email@email.com', password: '123456')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'entrar'

    click_on 'Criar Listas de Receitas'
    fill_in 'Nome', with: 'Sobremesas de Domingo'
    click_on 'Enviar'

    click_on 'Voltar'

    click_on 'Criar Listas de Receitas'
    fill_in 'Nome', with: 'Sobremesas de Domingo'
    click_on 'Enviar'

    expect(page).to have_content('Não foi possível criar nova Lista')
  end

  scenario 'succesfully' do
    user = User.create(email: 'email@email.com', password: '123456')
    another_user = User.create(email: 'another_email@email.com', password: '123456')
    RecipeList.create(name: 'Pratos de Natal', user: user)
    RecipeList.create(name: 'Sobremesas de Domingo', user: user)
    RecipeList.create(name: 'Lanchinhos da Madrugada', user: another_user)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'entrar'

    click_on 'Minhas Listas'

    expect(page).to have_css('li', text: 'Pratos de Natal')
    expect(page).to have_css('li', text: 'Sobremesas de Domingo')
    expect(page).not_to have_css('li', text: 'Lanchinhos da Madrugada')
  end
end
