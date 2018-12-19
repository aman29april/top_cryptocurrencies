# frozen_string_literal: true

Rails.application.routes.draw do
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'login', to: 'sessions#new'
  resources :sessions, only: %i[create destroy new]
  get 'home', to: 'home#show', as: :home

  root to: 'home#show'
end
