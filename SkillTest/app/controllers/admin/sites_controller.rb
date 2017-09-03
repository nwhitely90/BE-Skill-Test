class Admin::SitesController < Admin::BaseController
  before_action :require_login
  
  def index
    @user = User.find(session["user_id"])
    @sites = Site.where(user_id: @user.id)
  end  
  
  def new
    @site = Site.new
  end
  
  def edit
    @site = Site.friendly.find(params[:id])
    check_valid_user; return  if performed?
    
  end
  
  def show
    @site = Site.friendly.find(params[:id])
    check_valid_user; return  if performed?
  end
  
  def update
   @site = Site.friendly.find(params[:id])
   check_valid_user; return  if performed?
   
    if @site.update(site_params)
      redirect_to admin_site_path(@site)
    else
      render 'edit'
    end  
  end

  def create
     @user = current_user
     @site = Site.new(site_params)
     @site.user = @user
    
    if @site.save
    redirect_to admin_site_path(@site)
    else
      render 'new'
    end
  end

  def destroy
      @site = Site.friendly.find(params[:id])
      check_valid_user; return  if performed?
      
      if @site.destroy
        redirect_to admin_sites_path,notice: '削除成功しました。'
      else
        redirect_to admin_sites_path,alert: '削除失敗しました。'
      end
  end
  
  private
    def site_params
      params.require(:site).permit(:name, :explanation, :site_url, :active, :image)
    end
end
