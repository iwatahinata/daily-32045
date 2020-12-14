Rails.application.routes.draw do
  devise_for :users
  root to: "foods#index"
   resources :foods do
    resources :orders, only: [:create, :index]
    collection do
      get 'search'
    end
   end

  resources :users, only: :show
  
end


