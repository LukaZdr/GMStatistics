Rails.application.routes.draw do
  root to: 'landing_page#show'

  resources :users, only: [:show, :index]

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :server_starts, only: [:create]
      resources :rounds, only: [:create] do
        patch :end, on: :collection
      end
    end
  end
end 
