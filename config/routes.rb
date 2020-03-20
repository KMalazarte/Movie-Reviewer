Rails.application.routes.draw do

  post '/login', to: 'auth#create'
  # post '/signup', to: "users#create"
  get '/profile', to: "users#profile"
  get '/movies/:title', to: "movies#show"
  get '/movies', to:"movies#index"
  get '/movies/:title/reviews', to: "reviews#show"
  post '/movies/:id/reviews', to: "reviews#create"
  get '/profile', to: 'users#profile'
  get '/reviews/:id', to: "reviews#user_reviews"
  delete 'review/:id', to: "reviews#delete"
  patch 'review/:id', to: "reviews#update"
  resources :auth, :reviews, :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
