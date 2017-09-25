class ProductsController < FrontBaseController
  before_action :get_site 
  
  def show
    @product = Product
               .includes(:site)
               .where(id: params[:id])
               .active
               .first
               
    
    if @product.blank?
      raise ActionController::RoutingError.new('商品が見つかりません。')
    end
    
    @related_products = Product
                        .tagged_with(@product.tag_list)
                        .where
                        .not(id: @product.id)
                        .limit(5)
  end
end
