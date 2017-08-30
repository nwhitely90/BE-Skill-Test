class TagsController < FrontBaseController
  def show
    @tag = Tag.friendly.find(params[:id])
    @site = Site.friendly.find(params[:front_site_id])
    @products = Product.joins("inner join taggings tg on products.id = tg.taggable_id inner join tags t on t.id = tg.tag_id").where("site_id = ? and active = ? and name= ?" , @site.id, 1,@tag.name).paginate(:page => params[:page]).order('id DESC')
    #@tags = Tag.joins("inner join taggings tg on tg.tag_id = tags.id inner join products p on p.id = tg.taggable_id").select("tags.*").where("site_id = ?", @site.id)

    #front_site_id
    
    #render plain: params
    #front_site_id
    
    if @products.blank?
      raise ActionController::RoutingError.new('商品が見つかりません。')
    end
  end
end
#select * from products p 
#inner join taggings tg on p.id = tg.taggable_id
#inner join tags t on t.id = tg.tag_id
#where name ="a" and site_id=11


