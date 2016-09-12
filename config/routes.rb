Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:new, :create]

  resources :links, except: [:show, :destroy]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :links, only: [:index, :update]
    end
  end
end
