Rails.application.routes.draw do
  
  resources :order_items
  get '/products/import',to: "products#import"
  get '/orders/prathap_imports',to: "orders#prathap_imports"
  resources :variants
  resources :products
  resources :orders 
  
  # resources :orders do
  #    collection do
  #      get 'import'
  #    end
  # end
   


  resources :products do
    collection do
      get 'import'
    end
    resources :variants
  end

  #get '/orders/import',to: "orders#import"
 

  #get "sessions/new"
  #post "sessions/create"
  #get "sessions/destroy"
  

  resources :accounts do
	member do
	  get 'test_connection'
	end
  end
  resources :accounts
  
  

  get 'dashboard/index'
  post "/dashboard/create_contest",to: 'dashboard#create_contest'
  root 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  get 'shopify/authorize',to: "shopify#authorize"
  post 'shopify/authorize',to: "shopify#authorize"

  get 'shopify/install',to: "shopify#install"
  post 'shopify/install',to: "shopify#install"

  get 'shopify/confirm',to: "shopify#confirm"

end
