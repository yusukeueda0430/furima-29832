class ProductsController < ApplicationController
  def index
    @product = Product.all.order("created_at DESC")
    
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    # if @product.valid?
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :details, :category_id, :status_id, :fee_id, :consider_id, :days_id, :price, :image).merge(user_id: current_user.id)
  end

end
