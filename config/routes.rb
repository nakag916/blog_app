Rails.application.routes.draw do

  get 'sessions/new'

  root 'top#index'
  get '/signup', to:'users#new'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  get '/logout', to:'sessions#destroy'

  resources :users
  resources :articles
end
