class OrdersController < ApplicationController
  before_action :shuppinsha_root_path, only: [:index]
  before_action :kounyuu_root_path, only: [:index]

  def index
    @product = Product.find(params[:product_id])
    @order_address = OrderAddress.new
  end

  def create
    @product = Product.find(params[:product_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_product
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @product.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def order_params
    params.require(:order_address).permit(:postal, :consider_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, product_id:params[:product_id], token:params[:token])
  end

  def shuppinsha_root_path
    @product = Product.find(params[:product_id])
    if user_signed_in? && current_user.id == @product.user_id
      redirect_to root_path
    end
  end

  def kounyuu_root_path
    @product = Product.find(params[:product_id])
    if @product.order
      redirect_to root_path
    end
  end

end
