Rails.application.routes.draw do
	devise_for :users  
  devise_for :admins
  root to: 'posts#index'
  
  resources :posts do
  	resource :maps
  	resources :charges
  	resources :likes
  end

  resources :news

  resources :orders
  resources :tags

end
