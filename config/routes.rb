Rails.application.routes.draw do
  
  get '/products/import',to: "products#import"
  
  resources :variants
  resources :products
  
  resources :products do
  collection do
  get 'import'
  end
  resources :variants
  end



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
  root 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'shopify/authorize',to: "shopify#authorize"
  post 'shopify/authorize',to: "shopify#authorize"

  get 'shopify/install',to: "shopify#install"
  post 'shopify/install',to: "shopify#install"

  get 'shopify/confirm',to: "shopify#confirm"

end
