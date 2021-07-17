Rails.application.routes.draw do
  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new'
    post 'admins/sign_in' => 'admins/sessions#create'
    delete 'admins/sign_out' => 'admins/sessions#destroy'   
  end

  devise_for :customers, skip: :all
  devise_scope :customer do
    get 'customers/sign_in' => 'customers/sessions#new'
    post 'customers/sign_in' => 'customers/sessions#create'
    delete 'customers/sign_out' => 'customers/sessions#destroy'
    get 'customers/sign_up' => 'customers/registrations#new'
    post 'customers' => 'customers/registrations#create'
    get 'customers/password/new' => 'customers/passwords#new'
  end

  namespace :admin do
    resources :sessions
    resources :homes
    resources :products
    resources :genres
    resources :customers
    resources :orders
    resources :order_details
  end
  
  namespace :public do
    resources :homes
    resources :products
    resources :customers
    resources :cart_products
    resources :orders
    resources :delivery_addresses
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
