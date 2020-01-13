Rails.application.routes.draw do
  resources :save_posts
  resources :admins
  resources :posts
  resources :users

  # Custom Routes
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  get '/users/:id', to: 'users#show'

end
