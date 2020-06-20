# frozen_string_literal: true

Rails.application.routes.draw do
  root 'lunch#go'
  get 'lunch/go'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :restaurants
  get 'signup' => 'users#new'
  resources :users
  resources :folders
end
