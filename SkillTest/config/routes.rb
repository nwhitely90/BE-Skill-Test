Rails.application.routes.draw do

  #ユーザー登録
  resources :users
  namespace :admin do
    root :to => 'home#index'
    resources :sites, :products, :home, :users, :user_sessions
  end
  
  #ログイン
  get    'login',   to: 'admin/user_sessions#new'
  post   'login',   to: 'admin/user_sessions#create'
  delete 'admin_logout',  to: 'admin/user_sessions#destroy'
  
  #フロント
  resources :front_site, path: '' do
    resources :product_detail
  end

end
