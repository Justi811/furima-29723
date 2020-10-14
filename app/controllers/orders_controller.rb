class OrdersController < ApplicationController
  before_action :set_item_id,only: [:index, :create]
  before_action :authenticate_user!
  before_action :purchase_restrictions

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
       @order.save
       return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:item_id, :postcode, :prefecture_id, :city, :adress, :bulding, :phone, :token).merge(user_id: current_user.id)
  end

  def set_item_id
    @item = Item.find(params[:item_id])
  end
  
  def purchase_restrictions
     redirect_to root_path if @item.user_id == current_user.id
  end

  def pay_item
    item_price = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: item_price[:price],
      card: order_params[:token],
      currency: 'jpy'
      )
    end
end



