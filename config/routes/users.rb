# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: {
               sign_in: :login,
               sign_up: :register
             },
             controllers: {
               registrations: 'users/registrations',
               sessions: 'users/sessions'
             }

  devise_scope :user do
    get 'login', to: 'users/sessions#new'
    get 'register', to: 'users/registrations#new'
    get 'profile', to: 'users/registrations#edit'
  end
end
