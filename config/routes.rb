Rails.application.routes.draw do
  resources :movies
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
