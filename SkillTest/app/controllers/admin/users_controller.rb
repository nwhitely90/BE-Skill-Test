class Admin::UsersController < Admin::BaseController
    skip_before_action :require_login, only: [:new, :create]

  def show
    @user = User.find(params[:id])
    check_user; return  if performed?
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    check_user; return  if performed?
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_root_path, notice: 'ユーザー登録出来ました'
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    check_user; return  if performed?
    
    if @user.update(user_params)
        redirect_to admin_user_path(@user), notice: 'ユーザー編集出来ました'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    check_user; return  if performed?
    if @user.destroy
      redirect_to admin_logout_path
    else
      render :edit
    end
    
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
    
    def check_user
      if @user.id != User.find(session["user_id"]).id
        redirect_to admin_root_path, alert: 'アクセス拒否'
      end
    end
end
