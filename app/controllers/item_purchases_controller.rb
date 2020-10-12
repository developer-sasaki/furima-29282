class ItemPurchasesController < ApplicationController
  def index
    @item_purchases = ItemPurchase.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item_purchases = ItemPurchase.new(item_purchase_params)
    if @item_purchases.valid?
      pay_item
      @item_purchases.save
      return redirect_to root_path
    
    else
      render 'index'
    end
  end

  private

  def item_purchase_params
    params.permit(:user, :item, :postal_code, :place_of_origin, :city, :addresses, :building, :phone_number,:item_id).merge(token: params[:token])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: item_purchase_params[:price],  # 商品の値段
    card: item_purchase_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
end

end