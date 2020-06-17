# frozen_string_literal: true

Rails.application.routes.draw do
  root 'lunch#go'
  get 'lunch/go'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :restaurants, only: %i[index show create new]
  resources :users
end
