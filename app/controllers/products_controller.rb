class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :update]
  before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!

  def index
    @product = Product.all.order("created_at DESC")
    
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
       redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit

  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
        render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    if product.valid?
       redirect_to root_path
    else
      render :show
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :details, :category_id, :status_id, :fee_id, :consider_id, :days_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
