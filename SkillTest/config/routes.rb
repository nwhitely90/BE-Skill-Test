Rails.application.routes.draw do

  #get 'product/new'

  #get 'product/create'

  #get 'product/destroy'

  resources :users
  namespace :admin do
    root :to => 'home#index'
    resources :sites, :products, :home, :users, :user_sessions
  end
  
  get    'login',   to: 'admin/user_sessions#new'
  post   'login',   to: 'admin/user_sessions#create'
  delete 'admin_logout',  to: 'admin/user_sessions#destroy'
  
end
