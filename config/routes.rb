Rails.application.routes.draw do
  root 'games#index'
  resources :games do
    resources :reviews, only: [:index, :new, :create]
    resources :game_tags, only: [:new, :create]
  end

  resources :tags, only: [:new, :create]

  resources :reviews, only: [:edit, :update, :destroy] do
    resources :comments, only: [:index, :new, :create]
  end

  resources :comments, only: [:edit, :update, :destroy]
  devise_for :users
end
