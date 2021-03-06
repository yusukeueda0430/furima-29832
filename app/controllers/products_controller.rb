class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  # before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]

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
    if @product.destroy
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

  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to root_path
  #   end
  # end
  
end
