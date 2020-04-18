Rails.application.routes.draw do
  root to: 'posts#index'

  # expose all post related routes except delete
  resources :posts, except: [:destroy] do
    resources :comments, only: [:create]
  end
  resources :categories, only: [:new, :create, :show]
end
