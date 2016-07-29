Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products
  resources :carts, only: [:index]
  post '/add_to_cart/:product_id', to: 'carts#create', as: 'add_to_cart'
  post '/update_quantity', to: 'carts#update_quantity', as: 'update_quantity'
  delete '/delete_cart_variants/:cart_variant_id', to: 'carts#delete_cart_variant', as: 'delete_cart_variant'

  resources :orders, only: [:show]
  post '/create_order/:cart_id', to: 'orders#show', as: 'create_order'

  resources :payments, only: [:create]

  root to: 'products#index'

end
