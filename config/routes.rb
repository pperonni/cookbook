Rails.application.routes.draw do
  root to: 'recipes#index'

  resources :recipes, only: %i[index show new create edit update]
  resources :recipe_types, only: %i[index show new create edit update]
end
