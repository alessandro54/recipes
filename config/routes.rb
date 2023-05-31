# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  draw(:users)
  # Defines the root path route ("/")
  # root "articles#index"
  root 'dashboards#index'
  resources :calendars do
    collection do
      get 'my_calendar'
      post 'today'
      post 'next_month'
      post 'prev_month'
    end
    resources :days, only: %i[new edit update], param: :date
  end
end
