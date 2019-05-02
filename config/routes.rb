Rails.application.routes.draw do
  resources :posts
  get 'users', to: 'users#index'
  get 'user/:id', to: 'users#show', as: 'user_show'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  root to: 'posts#index'
  
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships,       only: [:create, :destroy]
end
