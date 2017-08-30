class ProductDetailController < FrontBaseController
  def show
    @product = Product.where(id: params[:id], active: 1).first
    
    if @product.blank?
      raise ActionController::RoutingError.new('商品が見つかりません。')
    end
    
    @site = Site.find(@product.site_id)
    #render plain: @site.inspect
  end
end
