require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  before do
    @item_purchases = FactoryBot.build(:item_purchase)
  end

  it "priceがあれば保存ができること" do
    expect(@item_purchases).to be_valid
  end

  it "priceが空では保存ができないこと" do
    @item_purchases.price = nil
    @item_purchases.valid?
    expect(@item_purchases.errors.full_messages).to include("Price can't be blank")
  end
end
