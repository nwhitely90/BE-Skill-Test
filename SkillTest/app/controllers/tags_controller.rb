class TagsController < FrontBaseController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  
  def show
    @site = Site.friendly.find(params[:front_site_id])
    
    if Tag.friendly.exists?(params[:id])
      @tag = Tag.friendly.find(params[:id]) 
      @products = Product.joins("inner join taggings tg on products.id = tg.taggable_id inner join tags t on t.id = tg.tag_id")
                          .where("site_id = ? and active = ? and name= ?" , @site.id, 1,@tag.name)
                          .paginate(:page => params[:page])
                          .order('id DESC')
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


