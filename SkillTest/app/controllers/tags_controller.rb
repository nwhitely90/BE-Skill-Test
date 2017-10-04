class TagsController < FrontBaseController
  before_action :get_site
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  
  def index
    @product = Product.find(params[:product_id])
  end
  
  def show  
    if Tag.friendly.exists?(params[:id])
      @tag = Tag.friendly.find(params[:id]) 
      @products = Product.joins("inner join taggings tg on products.id = tg.taggable_id inner join tags on tags.id = tg.tag_id")
                          .where(site_id: @site.id).where(tags: {name: @tag.name})
                          .paginate(:page => params[:page])
                          .active
                          .order_id_desc
      if @products.blank?
        flash[:alert] = "対象の商品が存在しません。"
      end
    else
      #フロントに検索したタグを表示する
      @tag = Tag.new
      @tag.name = params[:id]
      flash[:alert] = "タグが存在しません。"
    end
  end
  
  private 
  def record_not_found
    raise ActionController::RoutingError.new('サイト見つかりませんでした。')
  end
end


