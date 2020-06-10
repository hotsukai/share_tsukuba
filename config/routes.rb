# frozen_string_literal: true

Rails.application.routes.draw do
  root 'lunch#go'
  get 'restaurants/new'
  # For details on the DSL available within this file, sgetee https://guides.rubyonrails.org/routing.html
  get 'lunch/go'
  get 'restaurats/'
  post 'restaurants/create'
end
