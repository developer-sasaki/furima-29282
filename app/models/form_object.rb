class FormObject
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :street1, :building, :phone, :token

  with_options presence: true do
    validates :user_id, :item_id, :city, :street1, :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Post code can't be blank" }
    validates :prefecture_id, numericality: { other_than: 1, message: 'prefecture must be other than 1' }
    validates :phone, numericality: { with: /\A\d{11}\z/, message: " phone can't be blank" }
  end

  def save
    purchase = ItemPurchase.create(item_id: item_id, user_id: user_id)
    Delivery.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street1: street1, building: building, phone: phone, item_purchase_id: purchase.id)
  end
end
