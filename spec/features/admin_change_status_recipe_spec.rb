require 'rails_helper'

feature 'Admin change recipes status' do
  scenario 'see pensding recipes' do
    User.create(email: 'admin@email.com', password: '123456', admin: true)
    user = User.create(email: 'email@email.com', password: '123456')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    another_cuisine = Cuisine.create(name: 'Estadunidense')
    Recipe.create(title: 'Brigadeiro', recipe_type: recipe_type, user: user,
                  cuisine: cuisine, difficulty: 'Fácil', cook_time: 30,
                  ingredients: 'Leite condensado, manteiga e chocolate em pó',
                  cook_method: 'Misture tudo em uma panela, deixe no fogo enquanto mexe, até começar a desgrudar do fundo', status: :pending)
    Recipe.create(title: 'Brownie', recipe_type: recipe_type, user: user,
                  cuisine: another_cuisine, difficulty: 'Médio', cook_time: 60,
                  ingredients: 'Manteiga, ovos, chocolate em pó, farinha e açúcar ',
                  cook_method: 'Misture tudo em uma panela até formar um creme, despeje em uma assadeira e leve ao forno por 40 min')
    Recipe.create(title: 'Pavê', recipe_type: recipe_type, user: user,
                  cuisine: cuisine, difficulty: 'Médio', cook_time: 90,
                  ingredients: 'Leite, BOLACHA maisena e chocolate em barra',
                  cook_method: 'Faça um creme branco o leite, derreta o chocolate e monte as camadas com a BOLACHA de maisena')

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
    User.create(email: 'admin@email.com', password: '123456', admin: true)
    user = User.create(email: 'email@email.com', password: '123456')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    Recipe.create(title: 'Brigadeiro', recipe_type: recipe_type, user: user,
                  cuisine: cuisine, difficulty: 'Fácil', cook_time: 30,
                  ingredients: 'Leite condensado, manteiga e chocolate em pó',
                  cook_method: 'Misture tudo em uma panela, deixe no fogo enquanto mexe, até começar a desgrudar do fundo')


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
    User.create(email: 'admin@email.com', password: '123456', admin: true)
    user = User.create(email: 'email@email.com', password: '123456')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    Recipe.create(title: 'Brigadeiro', recipe_type: recipe_type, user: user,
                  cuisine: cuisine, difficulty: 'Fácil', cook_time: 30,
                  ingredients: 'Leite condensado, manteiga e chocolate em pó',
                  cook_method: 'Misture tudo em uma panela, deixe no fogo enquanto mexe, até começar a desgrudar do fundo')


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
