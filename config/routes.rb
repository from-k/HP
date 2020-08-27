Rails.application.routes.draw do
  get 'events/index'
  get 'events/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # devise
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    invitations: 'users/invitations'
  }

  root "static_pages#home"
  # static_pagess
  get "/about", to: "static_pages#about"
  get "/activity", to: "static_pages#activity"
  get "/contact", to: "contacts#new"
  post "/contact", to: "contacts#create"
  # static_pages, events
  resources :events, only: [:index, :show]
  # admins
  namespace :admins do
    resources :contacts, only: [:index, :show, :update]
    resources :events, except: [:show]
  end
  # letter_opener
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
