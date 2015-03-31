Rails.application.routes.draw do
  root 'games#index'
  resources :games do
    resources :reviews, except: [:show]
  end

  devise_for :users

end
