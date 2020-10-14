FactoryBot.define do
  factory :form_object do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '横浜市緑区' }
    street1 { '青山1-7-1' }
    building { '柳町ビルディング5F' }
    phone { '09012345678' }
    token {'tok_abcdefghijk00000000000000000'}
    association :item
    association :user
  end
end
