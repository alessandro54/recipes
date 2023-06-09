# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  draw(:users)
  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'home#index'

  get 'dashboard', to: 'dashboards#index'
  get 'my_calendar', to: 'main_calendars#index'

  resources :main_calendars, only: :create
  resources :calendars do
    resources :days, only: %i[show new edit update], param: :date
  end
  resources :recipes

  resources :notifications, only: :create, format: :turbo_stream

  resource :playground if Rails.env.development?
end
