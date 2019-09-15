Rails.application.routes.draw do

  get 'biographies/show'
  get 'biographies/new'
  get 'biographies/edit'
  get 'stories/index'
  get 'stories/show'
  get 'stories/edit'
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show]
  resources :characters
  resources :stories
  resources :tables
  post 'dice', to: 'dice#index'
end
