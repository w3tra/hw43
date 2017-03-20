Rails.application.routes.draw do
  devise_for :users
  root to: "places#index"
  resources :places, only: [:show, :index]
  resources :cart_items, only: [:show, :create, :update, :destroy]
  resources :carts, only: [:show, :create, :update, :destroy]
  resources :orders, only: [:create, :index, :show]
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
