Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:new, :create]

  resources :links, only: [:index, :new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
