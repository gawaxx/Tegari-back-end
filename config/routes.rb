Rails.application.routes.draw do
  resources :reports
  resources :save_posts
  resources :admins
  resources :posts
  resources :users

  # Custom Routes
  get '/users/:id', to: 'users#show'
  get '/profile', to: 'users#profile'
  post '/users/create', to: 'users#docreate'
  get '/validate_user', to: 'users#validate_user'
  get '/users/:id/morepoints', to: 'users#pointsChange'
  patch 'users', to: 'users#update'
  delete '/users', to: 'users#destroy'

  post '/login', to: 'auth#create'
  
  delete '/posts/:id/destroy', to: 'posts#destroy'
  patch 'posts', to: 'posts#update'
  post 'posts', to: 'posts#create'
  
  post 'reports/docreate', to: 'reports#docreate'
  
  post 'saveposts', to: 'save_posts#create'
  

end
