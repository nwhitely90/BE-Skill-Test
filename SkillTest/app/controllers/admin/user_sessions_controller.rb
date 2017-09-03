# app/controllers/user_sessions_controller.rb
class Admin::UserSessionsController < ApplicationController
layout 'admin'
  
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:user_session][:email], params[:user_session][:password])
      redirect_back_or_to(admin_home_index_url)
    else
      #flash.now[:alert] = 'ログインが失敗しました'
      #render action: 'new'
      redirect_back_or_to(admin_home_index_url, notice: 'ログインが失敗しました。')
    end
  end

  def destroy
    logout
    redirect_to(admin_home_index_url, notice: 'ログアウトしました。')
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end