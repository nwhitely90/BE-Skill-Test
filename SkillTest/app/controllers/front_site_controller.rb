class FrontSiteController < FrontBaseController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  
  def index
     render :layout => false
  end

  def show
    
    begin
      @site = Site.friendly.find(params[:id])
      
    if @site.blank? || @site.active != true
      record_not_found
    end
      @products = Product.where(site_id: @site.id, active: 1)
                  .paginate(:page => params[:page])
                  .order('id DESC')
                  
      @tags = Tag.joins("INNER JOIN taggings tg ON tg.tag_id = tags.id INNER JOIN products p ON p.id = tg.taggable_id")
                  .select("DISTINCT (name), tags.*")
                  .where("site_id = ? and taggings_count > 0", @site.id)
    rescue
      record_not_found
    end 
    
  end
  
  private 
  def record_not_found
    raise ActionController::RoutingError.new('サイト見つかりませんでした。')
  end
  
end
