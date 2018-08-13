# frozen_string_literal: true

Rails.application.routes.draw do
  resources :organizations
  root 'pages#index'
  devise_for :users, controllers: {omniauth_callbacks: 'callbacks'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users', to: 'users#index', as: 'users'
  get 'upload_csv', to: 'pages#upload_csv'
end
