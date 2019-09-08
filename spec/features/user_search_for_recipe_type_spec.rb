require 'rails_helper'

feature 'User search for recipe_type' do
  scenario 'succesfully' do
    user = create(:user)
    cuisine = create(:cuisine)
    recipe_type = create(:recipe_type)
    recipe = create(:recipe)
    recipe = create(:recipe, title: 'Pavê')

    login_as user, scope: :user

    visit root_path
    click_on 'Tipos de Receitas'
    click_on 'Sobremesa'

    expect(page).to have_css('h1', text: 'Sobremesa')
    expect(page).to have_css('li', text: 'Brigadeiro')
    expect(page).to have_css('li', text: 'Pavê')
  end
  scenario 'and find nothing' do
    user = create(:user)
    recipe_type = create(:recipe_type)

    login_as user, scope: :user

    visit root_path
    click_on 'Tipos de Receitas'
    click_on 'Sobremesa'

    expect(page).to have_css('h1', text: 'Sobremesa')
    expect(page).not_to have_css('li', text: 'Brigadeiro')
  end
end
