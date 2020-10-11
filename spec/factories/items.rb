FactoryBot.define do
  factory :item do
    name { 'アイテム' }
    item_detail { 'name' }
    price { 300 }
    category_id { 2 }
    status_id { 3 }
    shipping_status_id { 3 }
    delivery_term_id {4}
    place_of_origin_id {5}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
