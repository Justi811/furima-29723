class OrdersController < ApplicationController
  before_action :set_item_id, only: [:index, :create]
  before_action :authenticate_user!
  before_action :owner_restrictions
  before_action :ordered_item
  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postcode, :prefecture_id, :city, :address, :building, :phone, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item_id
    @item = Item.find(params[:item_id])
  end


  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item_price[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  # 所有しているアイテムは注文できない
  def owner_restrictions
    redirect_to root_path if current_user.id == @item.user_id
  end

  # 購入済みのアイテムに対しての処理に対するトップページ遷移
  def ordered_item
    redirect_to root_path if @item.order.present?
  end
end
