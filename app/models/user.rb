class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :item
  has_many :item_purchase
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :birth_day, presence: true
  validates :nickname, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' }

  # バリデーションを加えたところ↓
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :last_name_zenkaku_kanji
    validates :first_name_zenkaku_kanji
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: '全角カナ文字を使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end
end
