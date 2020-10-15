require 'rails_helper'

RSpec.describe FormObject, type: :model do
  before do
    seller = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: seller.id)
    buyer = FactoryBot.create(:user)
    @form_object = FactoryBot.build(:form_object, item_id: item.id, user_id: buyer.id)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it 'post_code, prefecture, city, street1, building, phone,tokenがあれば保存ができること' do
        expect(@form_object).to be_valid
      end
    end

    context '商品購入がうまく行かないとき' do
      it 'cityが空では登録できないこと' do
        @form_object.city = ''
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("City can't be blank")
      end
      it 'street1が空では登録できないこと' do
        @form_object.street1 = ''
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Street1 can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @form_object.token = ''
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空では登録できずハイフンが必要なこと' do
        @form_object.post_code = ''
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Post code can't be blank")
      end
      it '都道府県が空では登録できない' do
        @form_object.prefecture_id = ''
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '電話番号はハイフンは不要で、11桁以内でご入力が必要なこと' do
        @form_object.phone = ''
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Phone can't be blank")
      end
    end
  end
end
