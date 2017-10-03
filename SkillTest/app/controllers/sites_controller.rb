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
                
    @tags = Tag.joins(:taggings, "INNER JOIN products ON products.id = taggings.taggable_id")
                .select(:name)
                .distinct
                .where(:products => {site_id: @site.id})
                .active_taggings

            #joins("INNER JOIN taggings tg ON tg.tag_id = tags.id INNER JOIN products p ON p.id = tg.taggable_id")
  end
  
end
