Rails.application.routes.draw do
  root to: 'events#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get '/showpage', to: 'users#show'
  resources :attendable_events
  delete '/cancel_event_attendance', to: 'events#cancel_event_attendance'
	post '/request_attendance', to: 'events#request_attendance'

  resources :users, only: [:new,:create, :show]
  resources :events, only: [:index, :new, :create, :show ]
  
  resources :events do
    post 'attend', on: :member
  end

end
