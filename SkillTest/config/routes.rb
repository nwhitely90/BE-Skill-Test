Rails.application.routes.draw do

  #ユーザー登録
  namespace :admin do
    root :to => 'home#index'
    resources :sites, :products, :home, :users, :user_sessions
  end
  
  #ログイン
  get    'login',   to: 'admin/user_sessions#new'
  post   'login',   to: 'admin/user_sessions#create'
  get '/admin/logout' => 'admin/user_sessions#destroy', :as => 'admin_logout'
  
  #フロント
  resources :front_site, path: '' do
    resources :product_detail, :tags
  end

end
