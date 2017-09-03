class Admin::ProductsController < Admin::BaseController
  
  def index
    @site = Site.find(params[:site_id])
    @products = Product.where(site_id: @site.id)
                      .paginate(:page => params[:page])
                      .order('id DESC')
  end
  
  def show
    @product = Product.find(params[:id])
    @site = Site.friendly.find(@product.site_id)
  end
  
  def new
    @product = Product.new
  end
  
  def edit
    @product = Product.find(params[:id])
    @site = Site.friendly.find(@product.site_id)
  end

  def update
   @product = Product.find(params[:id])
   
  if @product.update(product_params)
    redirect_to admin_product_path(@product)
  else
    render 'edit'
    end  
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

  def destroy
      @product = Product.find(params[:id])
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
end
