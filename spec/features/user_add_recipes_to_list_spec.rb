require 'rails_helper'

feature 'User add recipes to lists' do
  scenario 'succesfully' do
    user = User.create(email: 'email@email.com', password: '123456')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    RecipeList.create(name: 'Sobremesas de Domingo', user: user)
    Recipe.create(title: 'Brigadeiro', recipe_type: recipe_type, user: user,
                  cuisine: cuisine, difficulty: 'Fácil', cook_time: 30,
                  ingredients: 'Leite condensado, manteiga e chocolate em pó',
                  cook_method: 'Misture tudo em uma panela, deixe no fogo enquanto mexe, até começar a desgrudar do fundo')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'entrar'

    click_on 'Brigadeiro'
    select 'Sobremesas de Domingo', from: 'Listas de Receitas'
    click_on 'Adicionar'

    expect(page).to have_css('li', text: 'Brigadeiro')
    expect(page).to have_content('Receita Adicionada com Sucesso')
    end
  end
