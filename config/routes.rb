Rails.application.routes.draw do
  root to: 'landing_page#show'

  resources :users, only: [:show, :index]

  # Api Endpoints
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :server_starts, only: [:create]
    end
  end
end
