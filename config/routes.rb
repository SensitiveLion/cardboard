Rails.application.routes.draw do
  root 'games#index'
  resources :games
  devise_for :users

end
