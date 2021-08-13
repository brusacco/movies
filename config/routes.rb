Rails.application.routes.draw do
  resources :movies

  resources :users do
    resources :favorites
  end

  resources :favorites
  post '/favorites/:id', to: 'favorites#create'
  get '/user/:id/favorites', to: 'favorites#list'

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
