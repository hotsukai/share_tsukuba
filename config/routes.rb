# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/new'
  root 'lunch#go'
  get 'lunch/go'
  # get 'restaurants/index'
  # get 'restaurants/' => 'restaurants#index'
  # get 'restaurants/new'
  # get 'restaurants/:id' => 'restaurants#show'
  # post 'restaurants/create'

  resources :restaurants, only: %i[index show create new]
  get 'sign_up', to: 'users#new'
end
