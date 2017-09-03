class Admin::UsersController < Admin::BaseController
  http_basic_authenticate_with name: "user_add_admin", password: "ay8SHPA0z."

  def index
  end

  
  def show
    @user = User.find(params[:id])
  end

  
  def new
    @user = User.new
  end

  
  def edit
    @user = User.find(params[:id])
  end

  
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_path(@user), notice: 'ユーザー登録出来ました'
    else
      render :new
    end
  end

  
  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_user_path(@user), notice: 'ユーザー編集出来ました'
      else
        render :edit
      end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
