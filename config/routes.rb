Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :users

  get '/dashboard', to: 'users#show'
  get '/login', to: 'users#login_form'
  delete '/logout', to: 'users#destroy'

  post '/login', to: 'users#login_user'
  get '/register', to: 'welcome#register'
  post '/register', to: 'welcome#create'
  get '/dashboard/discover', to: 'users#discover'

  post '/dashboard/movies', to: 'user_movies#search'
  get '/dashboard/movies', to: 'user_movies#index'
  get '/dashboard/movies/:id', to: 'user_movies#show'
  get '/dashboard/movies/:id/viewing-party/new', to: 'parties#new'
  post '/dashboard/movies/:id/viewing-parties', to: 'parties#create'
end
