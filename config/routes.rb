# frozen_string_literal: true

Rails.application.routes.draw do
  get 'calendar/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'register', to: 'devise/registrations#new'
    get 'profile', to: 'users/registrations#edit'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :calendars, only: [:index]
  root 'home#index'
end
