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
    get '/' => 'homes#top'
    resources :products
    resources :genres
    resources :customers
    resources :orders
    resources :order_details
  end
  root to: 'public/homes#top'
  scope module: :public do
    # get 'homes/top'
    get 'homes/about'
    resources :homes
    resources :products
    resources :customers
    get 'customers/my_page'
    get 'unsubscribe' => 'customers#unsubscribe'
    put "/customers/:id/withdraw" => "customers#withdraw", as: 'customers_withdraw'
    resources :cart_products
    delete 'cart_products' => 'cart_products#all_destroy', as: 'all_destroy'
    resources :genres
    get 'orders/thanks' => 'orders#thanks'
    get 'orders/confirm' => 'orders#confirm'
    resources :orders
    resources :delivery_addresses
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
