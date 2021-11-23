Rails.application.routes.draw do

  root 'sessions#welcome'


  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

 
  resources :users
  resources :reviews
  resources :books do
    resources :reviews, only: [:new, :index, :show]
  end


  get '/auth/:provider/callback' => 'sessions#create'

 
   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
