require 'rails_helper'

feature 'User create recipe lists' do
  scenario 'succesfully' do
    create(:user)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Senha', with: '123456'
    click_on 'entrar'

    click_on 'Criar Listas de Receitas'
    fill_in 'Nome', with: 'Sobremesas de Domingo'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Sobremesas de Domingo')
  end

  scenario 'succesfully' do
    create(:user)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'test@example.com'
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
    user = create(:user)
    another_user = create(:user, email: 'email@email.com')
    create(:recipe_list, name: 'Pratos de Natal', user_id: user.id)
    create(:recipe_list, name: 'Sobremesas de Domingo', user_id: user.id)
    create(:recipe_list, name: 'Lanchinhos da Madrugada',
                         user_id: another_user.id)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Senha', with: '123456'
    click_on 'entrar'

    click_on 'Minhas Listas'

    expect(page).to have_css('li', text: 'Pratos de Natal')
    expect(page).to have_css('li', text: 'Sobremesas de Domingo')
    expect(page).not_to have_css('li', text: 'Lanchinhos da Madrugada')
  end
end
