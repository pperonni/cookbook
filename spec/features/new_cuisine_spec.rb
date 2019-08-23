require 'rails_helper'

feature 'User register cuisine' do
  scenario 'succesfully' do

    visit root_path
    click_on 'Cadastrar Cozinha'

    fill_in 'Nome', with: 'Brasileira'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Brasileira')
  end

  scenario 'must fill in all fields' do

    visit root_path
    click_on 'Cadastrar Cozinha'

    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Não foi possível cadastrar Tipo de Receita')
  end

  scenario 'must fill in all fields' do

    visit root_path
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
