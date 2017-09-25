class SitesController < FrontBaseController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  
  #サイトトップ
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
                  .order_id_desc
                  
      @tags = Tag.joins(:taggings, "INNER JOIN products ON products.id = taggings.taggable_id")
                  .select(:name)
                  .distinct
                  .where(:products => {site_id: @site.id})
                  .active_taggings
                  
              #joins("INNER JOIN taggings tg ON tg.tag_id = tags.id INNER JOIN products p ON p.id = tg.taggable_id")
                  
    rescue
      record_not_found
    end   
  end
  
  private 
  def record_not_found
    raise ActionController::RoutingError.new('サイト見つかりませんでした。')
  end
  
end
