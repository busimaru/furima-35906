class OrdersController < ApplicationController
  before_action :redirect_root, only: [:index]
  def index
    @item = Item.find(params[:item_id])
    @order_adress = OrderAdress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_adress = OrderAdress.new(order_adress_params)
    if @order_adress.valid?
      pay_time
      @order_adress.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_adress_params
    params.require(:order_adress).permit(:postcode, :prefecture_id, :municipalities, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_time
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_adress_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def redirect_root
    @item = Item.find(params[:item_id])
    redirect_to root_url unless user_signed_in? && current_user.id != @item.user_id && Order.find_by(item_id: @item.id).nil?
  end
end
