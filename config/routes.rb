# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  resources :organizations
  post 'organization/:id/extract/new', to: 'statement_loaders#extract_tax', as: 'extract_tax'
  get 'organization/:id/extract/new', to: 'statement_loaders#new', as: 'extract_new'

  get 'extract_tax/:id', to: 'statement_loaders#redirect_taxes'

  resources :taxes
  resources :survey, only: %i[new create]
  resources :tasks

  root 'pages#index'

  devise_for :users, controllers: {omniauth_callbacks: 'callbacks'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users', to: 'users#index', as: 'users'

  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end
end
