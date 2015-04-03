Rails.application.routes.draw do
  get 'users/show'

  get 'users/show'

  root 'games#index'
  resources :games do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :reviews, only: [:edit, :update, :destroy] do
    resources :comments, only: [:index, :new, :create]
  end
  resources :comments, only: [:edit, :update, :destroy]
  devise_for :users
end
