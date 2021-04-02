Rails.application.routes.draw do
  resources :events, only: [:index, :new, :create, :show]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'pages/home'
  get '/signup', to: 'users#new'
  get '/showpage', to: 'users#show'
  get '/show', to: 'events#show'
  resources :users, only: [:create, :show]
 
 
end
