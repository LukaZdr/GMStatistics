# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'landing_page#show'

  resources :users, only: %i[show index]

  namespace :api do
    namespace :v1 do
      resources :user_round_actions, only: [:create]
      resources :server_starts, only: [:create]
      resources :users, only: [:create] do
        patch :logout, on: :collection
      end
      resources :rounds, only: [:create] do
        patch :end, on: :collection
      end
    end
  end
end
