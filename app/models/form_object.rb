class FormObject
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture, :city, :street1, :building, :phone

  validates :user_id, :item_id, :post_code, :prefecture, :city, :street, :building, :phone, presence: true
  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
  validates :phone, numericality: {with: /\A\d{11}\z/, message: "is invalid. Input 11 numeric."}



  with_options presence: true do
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  
  def save
    purchase=ItemPurchase.create(item_id: item, user_id: user)
    Delivery.create(post_code: post_code, prefecture: prefecture, city: city, street1: street, building: building, purchase: purchase.id)

end