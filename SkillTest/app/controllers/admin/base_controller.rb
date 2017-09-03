class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :require_login
  
  private
    def not_authenticated
      redirect_to login_path
    end
    
    #対象のユーザーのみサイトを管理出来る様に
    def check_valid_user
      if @site.user_id != User.find(session["user_id"]).id
        redirect_to admin_sites_path, alert: 'アクセス拒否'
        return
      end
    end
end
