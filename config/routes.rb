Rails.application.routes.draw do
  resources :profile_descriptions
  resources :posts do 
    resources :comments
  end
  
  resources :comments, only: [:create, :destroy]
  get 'users', to: 'users#index'
  get 'users', to: 'users#index'
  get 'user/:id', to: 'users#show', as: 'user_show'
  get 'user/:id/settings', to: 'users#settings', as: 'user_settings'
  get 'user/:id/followers', to: 'users#followers', as: 'user_followers'
  get 'user/:id/following', to: 'users#following', as: 'user_following'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  root to: 'posts#index'
  
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :likes, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
