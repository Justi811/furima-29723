class OrdersController < ApplicationController
  before_action :set_item_id,only: [:index, :create]
  before_action :authenticate_user!
  before_action :purchase_restrictions

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
  end

  private

  def order_params
    params.require(:order).permit(:user, :postcode, :prefecture_id, :city).merge(user_id: current_user.id)
  end

  def set_item_id
    @item = Item.find(params[:item_id])
  end
  
  def purchase_restrictions
    redirect_to root_path if user_signed_in? && @item.user_id == current_user.id
  end
end
