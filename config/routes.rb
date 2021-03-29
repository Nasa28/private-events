Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'pages/home'
  get '/signup', to: 'users#new'
  resources :users, only: [:create, :show]
end
