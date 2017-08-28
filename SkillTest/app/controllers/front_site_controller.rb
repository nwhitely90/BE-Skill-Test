class FrontSiteController < FrontBaseController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  
  def index
     render :layout => false
  end

  def show
    begin
      @site = Site.friendly.find(params[:id])
      @products = Product.where(site_id: @site.id, active: 1)
    rescue 
    end 
  end
  
  private 
  def record_not_found
    raise ActionController::RoutingError.new('404')
  end
  
end
