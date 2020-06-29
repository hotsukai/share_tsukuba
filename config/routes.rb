# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/go'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :spots
  get 'signup' => 'users#new'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :folders
  resources :user_relationships, only: %i[create destroy]
  resources :folder_spot_relationships, only: %i[create destroy]
end
