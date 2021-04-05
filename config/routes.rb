Rails.application.routes.draw do
  resources :events, only: [:index, :new, :create, :show ]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root to: 'pages#home'
  get '/signup', to: 'users#new'
  get '/showpage', to: 'users#show'
  resources :users, only: [:create, :show]
 
  resources :events do
    post 'attend', on: :member
  end
end
