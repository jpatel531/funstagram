Rails.application.routes.draw do
	devise_for :users  
  devise_for :admins
  root to: 'posts#index'

  post 'pusher/auth' => 'presence#auth'
  
  resources :posts do
  	resource :maps
  	resources :charges
  	resources :likes
  end

  resources :news

  resources :follows

  resources :orders
  resources :tags

end
