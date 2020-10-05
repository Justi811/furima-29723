class ItemsController < ApplicationController
  before_action :redirect_to_index, except: [:index, :show]

  def index
    @Items = Item.all
  end

  def new
    @item = Item.new

  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


private

  def item_params
    params.require(:item).permit(:user, :name, :description, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :shipping_date_id, :price).merge(user: current_user.id)
  end

  def redirect_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end

