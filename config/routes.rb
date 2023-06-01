# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  draw(:users)
  # Defines the root path route ("/")
  # root "articles#index"
  root 'dashboards#index'
  get 'my_calendar', to: 'calendars#show'
  resources :calendars do
    resources :days, only: %i[new edit update], param: :date
  end
  resources :recipes, only: %i[index new]
end
