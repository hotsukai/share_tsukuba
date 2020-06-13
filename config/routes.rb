# frozen_string_literal: true

Rails.application.routes.draw do
  root 'lunch#go'
  get 'lunch/go'
  # get 'restaurants/index'
  # get 'restaurants/' => 'restaurants#index'
  # get 'restaurants/new'
  # get 'restaurants/:id' => 'restaurants#show'
  # post 'restaurants/create'

  resources :restaurants, only: %i[index show create new]
  get 'signup' => 'users#new'
  resources :users
end
