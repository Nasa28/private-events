Rails.application.routes.draw do
  get 'sessions/new'
  get 'pages/home'
  resources :users, only: [:new, :create, :show]
end
