Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  get 'search', to: 'recipes#search'
  get 'myrecipes', to: 'recipes#myrecipes'
  get 'mylists', to: 'recipe_lists#mylists'

  resources :recipes, only: %i[index show new create edit update] do
    post 'add_to_list', on: :member
    get 'pending', on: :collection
    post 'approved', on: :member
    post 'rejected', on: :member
  end
  resources :recipe_types, only: %i[show new create]
  resources :cuisines, only: %i[show new create]
  resources :recipe_lists, only: %i[show new create]

  namespace :api do
    namespace :v1 do
      resources :recipes, only: %i[show]
    end
  end
end
