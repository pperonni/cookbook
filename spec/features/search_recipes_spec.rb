require 'rails_helper'

feature 'User search recipes' do
  scenario 'succesfully' do
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    Recipe.create(title: 'Brigadeiro', recipe_type: recipe_type,
                  cuisine: cuisine, difficulty: 'Fácil', cook_time: 30,
                  ingredients: 'Leite condensado, manteiga e chocolate em pó',
                  cook_method: 'Misture tudo em uma panela, deixe no fogo enquanto mexe, até começar a desgrudar do fundo')
    Recipe.create(title: 'Pavê', recipe_type: recipe_type,
                  cuisine: cuisine, difficulty: 'Médio', cook_time: 90,
                  ingredients: 'Leite, BOLACHA maisena e chocolate em barra',
                  cook_method: 'Faça um creme branco o leite, derreta o chocolate e monte as camadas com a BOLACHA de maisena')

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
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    another_cuisine = Cuisine.create(name: 'Estadunidense')
    Recipe.create(title: 'Brigadeiro', recipe_type: recipe_type,
                  cuisine: cuisine, difficulty: 'Fácil', cook_time: 30,
                  ingredients: 'Leite condensado, manteiga e chocolate em pó',
                  cook_method: 'Misture tudo em uma panela, deixe no fogo enquanto mexe, até começar a desgrudar do fundo')
    Recipe.create(title: 'Brownie', recipe_type: recipe_type,
                  cuisine: another_cuisine, difficulty: 'Médio', cook_time: 60,
                  ingredients: 'Manteiga, ovos, chocolate em pó, farinha e açúcar ',
                  cook_method: 'Misture tudo em uma panela até formar um creme, despeje em uma assadeira e leve ao forno por 40 min')
    Recipe.create(title: 'Pavê', recipe_type: recipe_type,
                  cuisine: cuisine, difficulty: 'Médio', cook_time: 90,
                  ingredients: 'Leite, BOLACHA maisena e chocolate em barra',
                  cook_method: 'Faça um creme branco o leite, derreta o chocolate e monte as camadas com a BOLACHA de maisena')

    visit root_path
    fill_in 'Buscar Receitas', with: 'Br'
    click_on 'Pesquisar'

    expect(page).to have_css('li', text: 'Brigadeiro')
    expect(page).to have_css('li', text: 'Brownie')
    expect(page).not_to have_css('li', text: 'Pavê')
  end
end
