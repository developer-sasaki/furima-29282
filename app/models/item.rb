class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category 
  belongs_to_active_hash :status
  belongs_to_active_hash :place_of_origin
  belongs_to_active_hash :delivery_term
  belongs_to_active_hash :shipping_status
  has_one_attached :image
  belongs_to:user
  has_one:item_purchase


   #空の投稿を保存できないようにする
   validates :name, :image, :item_detail, :price, :user, presence: true

   #ジャンルの選択が「--」の時は保存できないようにする
   validates :category_id, numericality: { other_than: 1 } 
   validates :status_id, numericality: { other_than: 1 } 
   validates :delivery_term_id, numericality: { other_than: 1 } 
   validates :place_of_origin_id, numericality: { other_than: 1 } 
   validates :shipping_status_id, numericality: { other_than: 1 } 

   validates :price,numericality: { only_integer: true, 
    greater_than: 300, less_than:9999999 }


  
  with_options presence: true do
    validates :price, format: { with: /\A[0-9]+\z/, message: "is invalid. Input full-width Half-width alphanumeric."}
  end

  
  
end
