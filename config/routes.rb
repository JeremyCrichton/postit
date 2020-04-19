Rails.application.routes.draw do
  root to: 'posts#index'

  # We create the register route manually because we don't want the URl to be /users/new as would be w/ resources
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # expose all post related routes except delete
  resources :posts, except: [:destroy] do
    resources :comments, only: [:create]
  end
  resources :categories, only: [:new, :create, :show]
  
  # Exclude new as we create manually above
  resources :users, only: [:show, :create, :edit, :update]
end
