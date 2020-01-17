Rails.application.routes.draw do
  resources :save_posts
  resources :admins
  resources :posts
  resources :users

  # Custom Routes
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  get '/users/:id', to: 'users#show'
  post '/users/create', to: 'users#docreate'
  get '/validate_user', to: 'users#validate_user'
  get '/users/:id/morepoints', to: 'users#pointsChange'
  delete '/posts/:id/destroy', to: 'posts#destroy'

end
