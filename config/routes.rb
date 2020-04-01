Rails.application.routes.draw do

  post '/login', to: 'auth#create'

  get '/profile', to: "users#profile"

  post '/movies', to: "movies#create"
  get '/movies', to:"movies#index"
  get '/movies/:id/reviews', to: "reviews#show"
  post '/movies/:id/reviews', to: "reviews#create"
  get '/movies/:id', to: "movies#show"
  put 'movies/:id', to: "movies#update"
  patch 'movies/:id', to: "movies#update"

  get '/reviews', to:"reviews#index"
  get '/reviews/:id', to: "reviews#user_reviews"
  delete 'review/:id', to: "reviews#delete"
  patch 'review/:id', to: "reviews#update"

  get '/users', to:'users#index'

  resources :auth, :reviews, :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
