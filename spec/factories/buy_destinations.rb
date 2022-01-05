FactoryBot.define do
  factory :buy_destination do
    token {"tok_abcdefghijk00000000000000000"}
    postcode { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '渋谷区' }
    addresses { '1-1' }
    building {'東京ハイツ'}
    phone_number { '09012345678' }
  end
end
