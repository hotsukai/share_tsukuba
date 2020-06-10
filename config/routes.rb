# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, sgetee https://guides.rubyonrails.org/routing.html
  get 'lunch/go', to: 'lunch#go'
end
