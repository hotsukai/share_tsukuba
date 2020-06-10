# frozen_string_literal: true

Rails.application.routes.draw do
  root 'lunch#go'
  # For details on the DSL available within this file, sgetee https://guides.rubyonrails.org/routing.html
  get 'lunch/go'
  get 'restaurants/index'
  get 'restaurants/' => 'restaurants#index'
  get 'restaurants/new'
  get 'restaurants/:id' => 'restaurants#show'
  post 'restaurants/create'
end
