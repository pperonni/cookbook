# frozen_string_literal: true

require 'rails_helper'

feature 'User add recipes to lists' do
  scenario 'succesfully' do
    user = create(:user)
    recipe_type = create(:recipe_type)
    cuisine = create(:cuisine)
    create(:recipe_list, user_id: user.id)
    create(:recipe, recipe_type_id: recipe_type.id,
                    cuisine_id: cuisine.id, user_id: user.id)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Senha', with: '123456'
    click_on 'entrar'

    click_on 'Brigadeiro'
    select 'Sobremesas de Domingo', from: 'Listas de Receitas'
    click_on 'Adicionar'

    expect(page).to have_css('li', text: 'Brigadeiro')
    expect(page).to have_content('Receita Adicionada com Sucesso')
  end
end
