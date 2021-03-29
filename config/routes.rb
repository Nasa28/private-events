Rails.application.routes.draw do
  get 'pages/home'
  resources :users, only: [:new, :create, :show]
end
