Rails.application.routes.draw do
  root to: 'landing_page#show'

  resources :users, only: [:show, :index]

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :server_starts, only: [:create]
      resource :round, only: [:create, :update] # this is a singe recource so the update doesn't axpect an id
    end
  end
end 
