class Admin::HomeController < Admin::BaseController
  
  def index
    @user = current_user
  end
   
end
