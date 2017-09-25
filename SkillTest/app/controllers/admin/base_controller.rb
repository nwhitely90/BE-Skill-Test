class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :require_login
  
  private
    def not_authenticated
      redirect_to login_path
    end
    
    #対象のユーザーのみサイトを管理出来る様に
    def check_valid_user(site)
      if site.user_id !=  current_user.id
        redirect_to admin_sites_path, alert: 'アクセス拒否'
        return
      end
    end
end
