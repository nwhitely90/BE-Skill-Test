class SitesController < FrontBaseController
  
  #サイトトップ
  def index
     render :layout => false
  end

  def show
    @site = Site.friendly.find(params[:id])
    
    @products = Product.where(site_id: @site.id, active: 1)
                .paginate(:page => params[:page])
                .order_id_desc
 
    @tags = Tag.joins(taggings: :product)
                .select(:name)
                .distinct
                .where(:products => {site_id: @site.id})
                .active_taggings

  end
  
end
