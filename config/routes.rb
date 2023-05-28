# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  draw(:users)
  # Defines the root path route ("/")
  # root "articles#index"
  resources :calendars, only: %i[index new create] do
    collection do
      post 'today'
      post 'next_month'
      post 'prev_month'
    end
  end
  resources :days, only: [:new]

  root 'home#index'
end
