class ItemsController < ApplicationController
  before_action :redirect_to_index, except: [:index, :show,:edit]
  before_action :set_item, only: [:edit, :update, :show]
  before_action :editorial_authority,only: [:edit]
  def index
    @items = Item.all.order("created_at DESC")
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

  private

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
    @item = current_user.items.build
   if user_signed_in? && @item.user == current_user.id
    else
      redirect_to root_path
    end
  end
end