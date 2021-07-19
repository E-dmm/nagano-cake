Rails.application.routes.draw do
  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    sessions: 'customers/sessions'
  }

  devise_for :admins
  devise_scope :admin do
    get 'admin/sign_in' => 'admin/sessions#new'
    post 'admins/sign_in' => 'admins/sessions#create'
    delete 'admins/sign_out' => 'admins/sessions#destroy'
  end




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
    resources :genres
    resources :orders
    resources :delivery_addresses
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
