Rails.application.routes.draw do

  root to: "welcome#index"

  get 'sessions/destroy'

  post 'users/create' => 'users#create'

  get 'users/:id' => 'users#show'

  get '/login' => "sessions#new"

  post '/sessions' => 'sessions#create'

  get '/sign_up', to: 'users#new', as: 'sign_up'

  resources :users 
 
end
