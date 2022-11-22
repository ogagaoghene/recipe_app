# frozen_string_literal: true

Rails.application.routes.draw do
  devise_scope :users do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  devise_for :users
  root to: 'users#index'
  resources :recipe_foods
  resources :foods
  resources :recipes
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
