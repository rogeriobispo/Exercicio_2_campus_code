Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get 'recipes/olds', to: 'recipes#old', as: 'recipes_olds'
  resources :recipes, only: [:show, :new, :create, :edit, :update]
  resources :cuisines, only: [:show, :new, :create]
  resources :recipe_types, only: [:show, :new, :create ]
end
