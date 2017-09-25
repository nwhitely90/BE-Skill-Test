class Admin::ProductsController < Admin::BaseController
  before_action :get_product, only: [:show, :edit,:update,:destroy]
  
  def index
    @site = Site.find(params[:site_id])
    @products = Product.where(site_id: @site.id)
                      .paginate(:page => params[:page])
                      .order_id_desc
  end
  
  def show
    @site = Site.friendly.find(@product.site_id)
    check_valid_user(@site)
      return  if performed?
  end
  
  def new
    @product = Product.new
  end
  
  def edit
    @site = Site.friendly.find(@product.site_id)
    check_valid_user(@site)
      return  if performed?
  end
  
  def create
     @site = Site.find(params[:product][:site_id])
     @product = Product.new(product_params)
     @product.site = @site
    
    if @product.save
    redirect_to admin_product_path(@product)
    else
      render 'new'
    end
  end

  def update
   @site = Site.friendly.find(@product.site_id)
   check_valid_user(@site)
    return  if performed?
   
  if @product.update(product_params)
    redirect_to admin_product_path(@product)
  else
    render 'edit'
    end  
  end

  def destroy
      @site = Site.friendly.find(@product.site_id)
      check_valid_user(@site)
        return  if performed?
    
      if @product.destroy
        redirect_to admin_products_path(:site_id => params[:site_id]),notice: '削除成功しました。'
      else
        redirect_to admin_products_path(:site_id => params[:site_id]),alert: '削除失敗しました。'
      end
  end
  
  private
   def product_params
     params.require(:product).permit(:amazon_id, :price, :title, :description, :image, :tag_list)
   end
   
  def get_product
    @product = Product.find(params[:id])
  end
end
