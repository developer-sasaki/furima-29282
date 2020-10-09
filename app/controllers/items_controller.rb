class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(message_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def show
  #   @item = Item.find(params[:id])
  # end

  private

  def message_params
    params.require(:item).permit(:name, :image, :item_detail, :price, :category_id, :status_id, :delivery_term_id, :place_of_origin_id, :shipping_status_id, :user).merge(user_id: current_user.id)
  end
end
