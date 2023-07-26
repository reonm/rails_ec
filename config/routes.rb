# frozen_string_literal: true

Rails.application.routes.draw do
  resources :items
  root 'items#index'
  resources :items do
    post 'add_to_cart', on: :member
  end
  # resources :cart_items, only: [:show] do
  #   get 'reset', on: :collection
  # end
  resources :cart_items, only: %i[show destroy] do
    get 'reset', on: :collection
    member do
      post 'delete_item', as: 'delete_cart_item'
    end
  end

  resources :orders

  resources :order_details

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :admin do
    resources :items
  end
end
