class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :place_of_origin
  belongs_to_active_hash :delivery_term
  belongs_to_active_hash :shipping_status
  has_one_attached :image
  belongs_to :user
  has_one :item_purchase

  # 空の投稿を保存できないようにする
  validates :name, :image, :item_detail, :price, :user, presence: true

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_term_id
    validates :place_of_origin_id
    validates :shipping_status_id
  end

  validates :price, inclusion: { in: 300..9_999_999, message: ' is invalid. Price need between ¥300〜9,999,999' }

  with_options presence: true do
    validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input Half-width numeric.' }
  end
end
