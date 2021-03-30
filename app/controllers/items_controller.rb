class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create]
  before_action :restriction_user, only: [:edit, :update, :destroy]


  def index
    @items = Item.order("id DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @item.purchase.present?
      if user_signed_in?
        redirect_to root_path
      else
        redirect_to new_user_session_path
      end
    end
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
    end
  end


  private
  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :state_id, :delivery_charge_id, :prefecture_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def restriction_user
    redirect_to root_path unless current_user.id == @item.user_id
  end
end
