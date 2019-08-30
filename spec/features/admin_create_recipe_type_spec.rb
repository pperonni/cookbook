require 'rails_helper'

feature 'Admin register recipe_types' do
  scenario 'succesfully' do
    User.create(email: 'admin@email.com', password: '123456', admin: true)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'admin@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'entrar'
    click_on 'Cadastrar Tipo de Receita'

    fill_in 'Nome', with: 'Sobremesa'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Sobremesa')
  end

  scenario 'must fill in all fields' do
    User.create(email: 'admin@email.com', password: '123456', admin: true)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'admin@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'entrar'
    click_on 'Cadastrar Tipo de Receita'

    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Não foi possível cadastrar Tipo de Receita')
  end

  scenario 'must fill in all fields' do
    User.create(email: 'admin@email.com', password: '123456', admin: true)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'admin@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'entrar'
    click_on 'Cadastrar Tipo de Receita'

    fill_in 'Nome', with: 'Sobremesa'
    click_on 'Enviar'

    click_on 'Voltar'

    click_on 'Cadastrar Tipo de Receita'

    fill_in 'Nome', with: 'Sobremesa'
    click_on 'Enviar'

    expect(page).to have_content('Não foi possível cadastrar Tipo de Receita')
  end
end
