class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :require_login
  
  private
    def not_authenticated
      redirect_to login_path
    end  
end
