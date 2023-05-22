# frozen_string_literal: true

Rails.application.routes.draw do
  get 'calendar/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'login', to: 'users/sessions#new'
    get 'register', to: 'users/registrations#new'
    get 'profile', to: 'users/registrations#edit'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :calendars, only: [:index] do
    collection do
      post 'next_month'
      post 'prev_month'
    end
  end
  root 'home#index'
end
