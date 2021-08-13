Rails.application.routes.draw do
  resources :movies

  resources :users do
    resources :favorites
  end

  resources :favorites

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
