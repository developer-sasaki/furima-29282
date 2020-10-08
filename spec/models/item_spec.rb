require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '新規出品がうまくいくとき' do
      it "nameとitem_detail、image、priceとcategory_id,status_id,delivery_term_id,place_of_origin_id,
    shipping_status_idが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context '新規出品がうまくいかないとき' do
      it '商品名が空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が空では登録できない' do
        @item.item_detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item detail can't be blank")
      end
      it '出品画像が空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'カテゴリーが空では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品の状態が空だと登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it '発送までの日数が空では登録できない' do
        @item.delivery_term_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery term must be other than 1')
      end
      it '発送元の地域が空では登録できない' do
        @item.place_of_origin_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Place of origin must be other than 1')
      end
      it '配送料の負担が空では登録できない' do
        @item.shipping_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping status must be other than 1')
      end
      it '価格が300円以下であれば登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price  is invalid. Price need between ¥300〜9,999,999')
      end
      it '価格が9,999,999円以上であれば登録できない' do
        @item.price = '10,000,000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price  is invalid. Price need between ¥300〜9,999,999')
      end
    end
  end
end
