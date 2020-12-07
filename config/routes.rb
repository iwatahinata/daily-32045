Rails.application.routes.draw do
  devise_for :users
  root to: "foods#index"
   resources :foods do
    collection do
      get 'search'
    end
   end

  resources :carts, only: [:show]
  resources :users, only: :show
  
end


