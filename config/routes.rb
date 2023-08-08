Rails.application.routes.draw do
  
  resources :dogs, only: [:index, :show, :create, :destroy, :update]
  resources :users, only: [:index]
  resources :users, only: [:show]


  post '/signup', to: 'users#create'

  get '/me', to: 'users#show'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  get '/dogs', to: 'dogs#index'

  get '/dogs/:id', to: 'dogs#show'

  patch '/dogs/:id', to: 'dogs#update'

  post '/dogs', to: 'dogs#create'

  delete '/dogs', to: 'dogs#destroy'

  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }

end
