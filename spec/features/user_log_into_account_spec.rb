# frozen_string_literal: true

require 'rails_helper'

feature 'User log into account' do
  scenario 'succesfully' do
    User.create(email: 'email@email.com', password: '123456')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'entrar'

    expect(page).to have_link 'Sair'
    expect(page).not_to have_link 'Entrar'
  end
  scenario 'succesfully' do
    User.create(email: 'email@email.com', password: '123456')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'entrar'

    click_on 'Sair'

    expect(page).to have_link 'Entrar'
    expect(page).not_to have_link 'Sair'
  end
end
