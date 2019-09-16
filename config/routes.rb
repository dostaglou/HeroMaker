Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show]
  resources :characters, except: [:show]
  resources :characters, only: [:show] do
    resources :biographies
  end
  resources :stories
  resources :tables
  post 'dice', to: 'dice#index'
end
