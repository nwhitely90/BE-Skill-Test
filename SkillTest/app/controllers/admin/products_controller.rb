class Admin::ProductsController < Admin::BaseController
  
  def index
    @site = Site.find(params[:site_id])
    @products = Product.where(site_id: @site.id)
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end
  
  def edit
    @product = Product.find(params[:id])
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
  end
  
  private
   def product_params
     params.require(:product).permit(:amazon_id, :price, :title, :description, :image)
   end
end
