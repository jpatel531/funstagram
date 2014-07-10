Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  
  resources :posts do
  	resource :maps
  end

  resources :tags

end
