Rails.application.routes.draw do
  get 'users', to: 'users#index'
  get 'user/:id', to: 'users#show', as: 'user_show'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  root to: 'users#index'
end
