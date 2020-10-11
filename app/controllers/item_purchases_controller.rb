class ItemPurchasesController < ApplicationController
  def index
    @item_purchases = ItemPurchase.new
  end

  def create
    @item_purchases = ItemPurchase.new(item_purchases_params)
    if @order.valid?
      @item_purchases.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def item_purchases_params
    params.require(:item_purchases).permit(:price)
  end

end