class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category 
  belongs_to_active_hash :status
  belongs_to_active_hash :place_of_origin
  belongs_to_active_hash :delivery_terms
  belongs_to_active_hash :shipping_status

   #空の投稿を保存できないようにする
   validates :name, :item_detail, :price, :user, :title, :text, :genre, presence: true

   #ジャンルの選択が「--」の時は保存できないようにする
   validates :genre_id, numericality: { other_than: 1 } 
   validates :category_id, numericality: { other_than: 1 } 
   validates :status_id, numericality: { other_than: 1 } 
   validates :delivery_terms_id, numericality: { other_than: 1 } 
   validates :place_of_origin_id, numericality: { other_than: 1 } 
   validates :shipping_status_id, numericality: { other_than: 1 } 

   validates :price,numericality: { only_integer: true, 
    greater_than: 300, less_than:9999999 }


  has_one_attached :image
  belongs_to:user
  has_one:item_purchase

  with_options presence: true do
    validates :price, format: { with: /\A[0-9]+\z/, message: "is invalid. Input full-width Half-width alphanumeric."}
  end

  
  
end
