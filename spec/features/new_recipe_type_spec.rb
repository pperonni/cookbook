require 'rails_helper'

feature 'User register recipe_types' do
  scenario 'succesfully' do

    visit root_path
    click_on 'Cadastrar Tipo de Receita'

    fill_in 'Nome', with: 'Sobremesa'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Sobremesa')
  end

  scenario 'must fill in all fields' do

    visit root_path
    click_on 'Cadastrar Tipo de Receita'

    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Não foi possível cadastrar Tipo de Receita')
  end

  scenario 'must fill in all fields' do

    visit root_path
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
