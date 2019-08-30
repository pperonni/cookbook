Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  get 'search', to: 'recipes#search'
  get 'myrecipes', to: 'recipes#myrecipes'
  get 'mylists', to: 'recipe_lists#mylists'

  resources :recipes, only: %i[index show new create edit update] do
    post 'add_to_list', on: :member
  end
  resources :recipe_types, only: %i[show new create edit update]
  resources :cuisines, only: %i[show new create edit update]
  resources :recipe_lists, only: %i[show new create]
end
