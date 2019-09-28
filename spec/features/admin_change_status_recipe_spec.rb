require 'rails_helper'

feature 'Admin change recipes status' do
  scenario 'see pending recipes' do
    create(:user, email: 'admin@email.com', admin: true)
    user = create(:user)
    recipe_type = create(:recipe_type)
    cuisine = create(:cuisine)
    create(:recipe, recipe_type_id: recipe_type.id,
                    user_id: user.id, cuisine_id: cuisine.id)
    create(:recipe, title: 'Brownie', recipe_type_id: recipe_type.id,
                    user_id: user.id, cuisine_id: cuisine.id)
    create(:recipe, title: 'Pavê', recipe_type_id: recipe_type.id,
                    user_id: user.id, cuisine_id: cuisine.id)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'admin@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'entrar'

    click_on 'Receitas Pendentes'

    expect(page).to have_css('h1', text: 'Receitas Pendentes')
    expect(page).to have_css('li', text: 'Brigadeiro')
    expect(page).to have_css('li', text: 'Pavê')
    expect(page).to have_css('li', text: 'Brownie')
  end

  scenario 'to accepted' do
    create(:user, email: 'admin@email.com', admin: true)
    user = create(:user)
    recipe_type = create(:recipe_type)
    cuisine = create(:cuisine)
    create(:recipe, recipe_type_id: recipe_type.id,
                    user_id: user.id, cuisine_id: cuisine.id)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'admin@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'entrar'

    click_on 'Receitas Pendentes'
    click_on 'Brigadeiro'

    click_on 'Aprovar'

    expect(page).to have_css('p', text: 'Receita Aprovada')
  end

  scenario 'to rejected' do
    create(:user, email: 'admin@email.com', admin: true)
    user = create(:user)
    recipe_type = create(:recipe_type)
    cuisine = create(:cuisine)
    create(:recipe, recipe_type_id: recipe_type.id,
                    user_id: user.id, cuisine_id: cuisine.id)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'admin@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'entrar'

    click_on 'Receitas Pendentes'
    click_on 'Brigadeiro'

    click_on 'Rejeitar'

    expect(page).to have_css('p', text: 'Receita Rejeitada')
  end
end
