class ItemPurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    @form_object =FormObject.new
  end

  def create
    @form_object =FormObject.new(item_purchase_params)
    if @form_object.valid?
      pay_item
      @form_object.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def item_purchase_params
    params.permit(:item_id, :post_code, :prefecture_id, :city, :street1, :building, :phone, :token).merge(user_id: current_user.id)
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: item_purchase_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
   end

  def set_item
     @item = Item.find(params[:item_id])
  end

end