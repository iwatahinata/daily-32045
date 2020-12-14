Rails.application.routes.draw do
  devise_for :users
  root to: "foods#index"
  post "favorites/:food_id/destroy" => "favorites#destroy"
  post "favorites/:food_id/create" => "favorites#create"
   resources :foods do
    resources :orders, only: [:create, :index]
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
   end

  resources :users, only: :show
  
end


