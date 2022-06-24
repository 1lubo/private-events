# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'events#index'

  get 'signup' => 'users#new', as: 'signup'
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'

  resources :users, only: %i[show new create]
  resources :sessions, only: %i[new create destroy]
  resources :events do
    member do
      get 'attend'
      get 'leave'
    end
  end
end
