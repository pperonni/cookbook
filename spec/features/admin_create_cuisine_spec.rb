require 'rails_helper'

feature 'Admin register cuisine' do
  scenario 'succesfully' do
    User.create(email: 'admin@email.com', password: '123456', admin: true)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'admin@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'entrar'
    click_on 'Cadastrar Cozinha'

    fill_in 'Nome', with: 'Brasileira'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Brasileira')
  end

  scenario 'must fill in all fields' do
    User.create(email: 'admin@email.com', password: '123456', admin: true)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'admin@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'entrar'
    click_on 'Cadastrar Cozinha'

    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Não foi possível cadastrar Tipo de Receita')
  end

  scenario 'and can not have same name' do
    User.create(email: 'admin@email.com', password: '123456', admin: true)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'admin@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'entrar'
    click_on 'Cadastrar Cozinha'

    fill_in 'Nome', with: 'Brasileira'
    click_on 'Enviar'

    click_on 'Voltar'

    click_on 'Cadastrar Cozinha'

    fill_in 'Nome', with: 'Brasileira'
    click_on 'Enviar'

    expect(page).to have_content('Não foi possível cadastrar Tipo de Receita')
  end
end
