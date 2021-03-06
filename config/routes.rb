Rails.application.routes.draw do
  root 'homes#index'
  resources :games do
    resources :reviews, only: [:index, :new, :create]
    resources :game_tags, only: [:new, :create]
  end

  resources :reviews do
    resources :upvotes, only: [:create]
    resources :downvotes, only: [:create]
    resources :comments, only: [:index, :new, :create]
  end

  resources :tags, only: [:new, :create]
  resources :reviews, only: [:edit, :update, :destroy]
  resources :comments, only: [:edit, :update, :destroy]

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup

  resources :users, only: [:index, :show, :update]
  resources :homes, only: [:index]

end
