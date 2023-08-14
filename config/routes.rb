Rails.application.routes.draw do

  resources :sets_completeds
  resources :sets_prescribeds
    # resources :dogs, only: [:index, :show, :create, :destroy, :update]

  
  resources :exercise_sets
  resources :exercises
  resources :days
  resources :workouts
  resources :users, only: [:index]
  resources :users, only: [:show]


  post '/signup', to: 'users#create'

  get '/me', to: 'users#show'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  get '/workouts', to: 'workouts#index'

  post '/workouts', to: 'workouts#create'

  post '/users', to: 'users#create'




# BELOW HERE ARE THE DOG SPECIFIC

  # get '/dogs', to: 'dogs#index'

  # get '/dogs/:id', to: 'dogs#show'

  # patch '/dogs/:id', to: 'dogs#update'

  # post '/dogs', to: 'dogs#create'

  # delete '/dogs', to: 'dogs#destroy'

  # get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }

end
