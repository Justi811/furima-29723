class ItemsController < ApplicationController
  before_action :redirect_to_index, except: [:index, :show, :edit,:search]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :editorial_authority, only: [:edit, :destroy]
  before_action :ordered_item, only: [:edit, :destroy]
  before_action :search_item, only: [:search,:search_index,:index]
  def index
    @items = Item.all.order('created_at DESC')
    
  end

  def new
    @item = Item.new
  end

  def show
  end

  def posts
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @items = Item.search(params[:keyword]).order('created_at DESC')

  end



  def search_index
    @items = Item.all.order('created_at DESC')
    @category = Category.where.not(id: 1)
    @condition = Condition.where.not(id: 1)
    @shipping_date =ShippingDate.where.not(id: 1)
    @order = Order.all
    @results = @si.result
  end



  private

  def search_item
    @si = Item.ransack(params[:q])
  end

  def item_params
    params.require(:item).permit(:user, :name, :description, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def redirect_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def editorial_authority
    redirect_to root_path unless user_signed_in? && @item.user_id == current_user.id
  end
end

def ordered_item
  redirect_to root_path if @item.order.present?
end
