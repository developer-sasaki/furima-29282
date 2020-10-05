class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show, :search]
  def index
    @items = Item.all
  end

  def new
    @item =Item.new
  end

  def create
    @item = Item.new(message_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end 
  

  # 画像の保存を許可するストロングパラメーター?user_idをitems_id?
  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
