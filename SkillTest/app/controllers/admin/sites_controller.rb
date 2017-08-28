class Admin::SitesController < Admin::BaseController
  before_action :require_login
  
  def index
    @sites = Site.all
  end  
  
  def new
    @site = Site.new
  end
  
  def edit
    @site = Site.find(params[:id])
  end
  
  def show
    @site = Site.friendly.find(params[:id])
  end
  
  def update
   @site = Site.find(params[:id])

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
  end
  
  private
    def site_params
      params.require(:site).permit(:name, :explanation, :active)
    end
end
