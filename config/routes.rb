Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products do
    resources :variants, shallow: true
  end

  root to: 'products#index'

end
