Rails.application.routes.draw do
  devise_for :users
  resources :items do
   resources :orders, only: :index
  end
  resources :adrress, only: :create
  root to: "items#index"
end
