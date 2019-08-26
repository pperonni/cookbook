Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  get 'search', to: 'recipes#search'
  get 'myrecipes', to: 'recipes#myrecipes'
  get 'mylists', to: 'recipe_lists#mylists'

  resources :recipes, only: %i[index show new create edit update] do
    post 'add_recipe', on: :member
  end
  resources :recipe_types, only: %i[index show new create edit update]
  resources :cuisines, only: %i[index show new create edit update]
  resources :recipe_lists, only: %i[index show new create]
end
