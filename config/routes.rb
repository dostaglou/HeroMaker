Rails.application.routes.draw do

  get 'abouts/new'
  get 'abouts/edit'
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show]
  resources :characters, except: [:show]
  resources :characters, only: [:show] do
    resources :biographies
  end
  resources :stories
  resources :tables
  resources :abouts

  post 'dice', to: 'dice#index'
end
