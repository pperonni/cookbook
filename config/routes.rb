Rails.application.routes.draw do
  root to: 'recipe#index'

  resources :recipe
end
