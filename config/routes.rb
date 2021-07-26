Rails.application.routes.draw do
  namespace :public do
    end
  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    sessions: 'customers/sessions'
  }

  devise_scope :customer do
    get '/customers/logout' => 'devise/sessions#destroy', as: :logout
  end


devise_for :admins, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }
  get 'admin/homes/top'
  namespace :admin do
    resources :homes
    resources :products
    resources :genres
    resources :customers
    resources :orders
    resources :order_details
  end
  root to: 'public/homes#top'
  scope module: :public do
    get 'homes/about'
    resources :homes
    resources :products
    resources :customers
    get 'customers/my_page' => "customers#show"
    get 'unsubscribe' => 'customers#unsubscribe'
    put "/customers/:id/withdraw" => "customers#withdraw", as: 'customers_withdraw'
    resources :cart_products
    delete 'cart_products' => 'cart_products#all_destroy', as: 'all_destroy'
    resources :genres
    get 'orders/thanks' => 'orders#thanks'
    post 'orders/confirm' => 'orders#confirm'
    resources :orders
    resources :delivery_addresses
    get '/search' => 'searches#search'
  end
end
