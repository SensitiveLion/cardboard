Rails.application.routes.draw do
  root 'games#index'
  resources :games do
    resources :reviews, only: [:index, :new, :create]
  end
<<<<<<< HEAD
  resources :reviews, only: [:edit, :update, :destroy]
  resources :reviews do
    resources :upvotes, only: [:create]
    resources :downvotes, only: [:create]
=======
  resources :reviews, only: [:edit, :update, :destroy] do
>>>>>>> e4b30dbb64b6d52868dc7c8a00b89f5048fd6ac4
    resources :comments, only: [:index, :new, :create]
  end
  resources :comments, only: [:edit, :update, :destroy]
  devise_for :users
end
