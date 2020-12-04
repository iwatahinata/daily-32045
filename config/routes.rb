Rails.application.routes.draw do
  devise_for :users
  root to: "foods#index"
  resources :foods

  resources :carts, only: [:show]
  resources :users, only: :show

end
