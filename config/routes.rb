Rails.application.routes.draw do
  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    sessions: 'customers/sessions'
  }
  
    devise_for :admins, controllers: {
    registrations: 'adimins/registrations',
    sessions: 'adimins/sessions'
  }
  
  namespace :admin do
    resources :homes
    resources :products
    resources :genres
    resources :customers
    resources :orders
    resources :order_details
  end
  root to: 'public/homes#top'
  namespace :public do
    # get 'homes/top'
    get 'homes/about'
    resources :homes
    resources :products
    resources :customers
    resources :cart_products
    resources :orders
    resources :delivery_addresses
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
