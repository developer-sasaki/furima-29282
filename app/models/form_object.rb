class FormObject
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :street1, :building, :phone, :token

  validates :user_id, :item_id, :city, :street1, :building, :token, presence: true
 



  with_options presence: true do
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はハイフンが必要です（例：123-4567）"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "都道府県名をお選びください"}
  # { other_than: 0, message: "can't be blank" }
  validates :phone, numericality: {with: /\A\d{11}\z/, message: " ハイフンは不要で、11桁以内でご入力ください"}
  
end
  
  def save
    purchase=ItemPurchase.create(item_id: item_id, user_id: user_id)
    Delivery.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street1: street1, building: building, phone: phone ,item_purchase_id: purchase.id)
  end

end