Rails.application.routes.draw do
  resources :movies

  resources :users do
    resources :favorites
  end

  resources :favorites
  match '/favorites/:id' => 'favorites#create', :via => [:post]

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
