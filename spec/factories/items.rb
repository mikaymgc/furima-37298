FactoryBot.define do
  factory :item do
    item_name { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    item_info { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    status_id { Faker::Number.between(from: 2, to: 7) }
    shipping_fee_status_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 28) }
    scheduled_delivery_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/testimage.png'), filename: 'testimage.png')
    end
  end
end
