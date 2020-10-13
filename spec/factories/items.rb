FactoryBot.define do
  factory :item do
    name { 'アイテム' }
    item_detail { 'name' }
    price { 300 }
    category { 2 }
    status { 3 }
    shipping_status { 3 }
    delivery_term {4}
    place_of_origin {5}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
