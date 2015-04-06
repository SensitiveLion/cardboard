Rails.application.routes.draw do
  root 'games#index'
  resources :games do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :reviews, only: [:edit, :update, :destroy]
  resources :reviews do
    resources :upvotes, only: [:create]
    resources :downvotes, only: [:create]
    resources :comments, only: [:index, :new, :create]
  end
  resources :comments, only: [:edit, :update, :destroy]
  devise_for :users
end
