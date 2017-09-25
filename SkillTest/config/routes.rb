Rails.application.routes.draw do

  #ユーザー登録
  namespace :admin do
    root :to => 'home#index'
    resource :user,:except => [:index]
    resources :home, :only => [:index]
    resources :user_sessions, :only => [:new, :create, :destroy]
    resources :sites, :products
  end
  
  #ログイン
  get    'login',   to: 'admin/user_sessions#new'
  post   'login',   to: 'admin/user_sessions#create'
  get '/admin/logout' => 'admin/user_sessions#destroy', :as => 'admin_logout'
  
  #フロント
  resources :sites, path: '', :only => [:index, :show] do
    resources :products, :only => [:show]
    resources :tags, :only => [:show]
  end

end
