# frozen_string_literal: true

require 'rails_helper'

feature 'User search recipes' do
  scenario 'succesfully' do
    user = create(:user)
    recipe_type = create(:recipe_type, name: 'Sobremesa')
    cuisine = create(:cuisine)
    create(:recipe, recipe_type_id: recipe_type.id,
                    user_id: user.id,
                    cuisine_id: cuisine.id)
    create(:recipe, title: 'Pavê',
                    recipe_type_id: recipe_type.id,
                    user_id: user.id,
                    cuisine_id: cuisine.id,
                    difficulty: 'Médio',
                    cook_time: 90,
                    ingredients: 'Leite, BOLACHA maisena e chocolate em barra',
                    cook_method: 'Faça um creme branco o leite, ' \
                                 'derreta o chocolate, ' \
                                 'monte as camadas com a BOLACHA de maisena')

    visit root_path
    fill_in 'Buscar Receitas', with: 'Brigadeiro'
    click_on 'Pesquisar'

    expect(page).to have_css('li', text: 'Brigadeiro')
    expect(page).not_to have_css('li', text: 'Pavê')
  end

  scenario 'succesfully' do
    visit root_path
    fill_in 'Buscar Receitas', with: 'Brigadeiro'
    click_on 'Pesquisar'

    expect(page).to have_content('Nenhuma Receita encontrada')
  end

  scenario 'succesfully' do
    user = create(:user)
    another_user = create(:user, email: 'email@email.com')
    recipe_type = create(:recipe_type, name: 'Sobremesa')
    cuisine = create(:cuisine)
    another_cuisine = create(:cuisine, name: 'Estadunidense')
    create(:recipe, recipe_type_id: recipe_type.id,
                    user_id: user.id,
                    cuisine_id: cuisine.id)
    create(:recipe, title: 'Brownie',
                    recipe_type_id: recipe_type.id,
                    user_id: another_user.id,
                    cuisine_id: another_cuisine.id,
                    difficulty: 'Médio',
                    cook_time: 60,
                    ingredients: 'Manteiga, ovos, chocolate em pó, ' \
                    'farinha e açúcar ',
                    cook_method: 'Misture tudo em uma panela, ' \
                                 'para assim formar um creme, ' \
                                 'despeje em uma assadeira e leve ao forno por 40 min')
    create(:recipe, title: 'Pavê',
                    recipe_type_id: recipe_type.id,
                    user_id: user.id,
                    cuisine_id: cuisine.id,
                    difficulty: 'Médio',
                    cook_time: 90,
                    ingredients: 'Leite, BOLACHA maisena e chocolate em barra',
                    cook_method: 'Faça um creme branco o leite, ' \
                                 'derreta o chocolate, ' \
                                 'monte as camadas com a BOLACHA de maisena')

    visit root_path
    fill_in 'Buscar Receitas', with: 'Br'
    click_on 'Pesquisar'

    expect(page).to have_css('li', text: 'Brigadeiro')
    expect(page).to have_css('li', text: 'Brownie')
    expect(page).not_to have_css('li', text: 'Pavê')
  end
end
