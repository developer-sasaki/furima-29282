class ItemPurchasesController < ApplicationController
  def index
    @item_purchases = ItemPurchase.new
  end

  def create
    @item_purchases = ItemPurchase.new(item_purchase_params)
    if @item_purchases.valid?
      @item_purchases.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def item_purchase_params
    params.require(:item_purchase).permit(:price).merge(token: params[:token])
  end

end