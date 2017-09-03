class Admin::HomeController < Admin::BaseController
  
  def index
    @user = User.find(session["user_id"])
  end
   
end
