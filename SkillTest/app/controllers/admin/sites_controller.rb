class Admin::SitesController < Admin::BaseController
  before_action :require_login
  before_action :get_site, only: [:edit,:update,:destroy]
  before_action only: [:edit,:update,:destroy]do
    check_valid_user(@site)
  end
  
  def index
    @user = current_user
  end  
  
  def show
    @user = current_user
    @site = Site.friendly.find(params[:id])

  end
  
  def new
    @site = Site.new
  end
  
  def edit  
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
  
  def update   
    if @site.update(site_params)
      redirect_to admin_site_path(@site)
    else
      render 'edit'
    end  
  end

  def destroy     
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
