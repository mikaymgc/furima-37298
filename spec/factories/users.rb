FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { 'abc@com' }
    password { '12345a' }
    password_confirmation { '12345a' }
    first_name { '山田' }
    last_name { '太郎' }
    first_name_kana { 'ヤマダ' }
    last_name_kana { 'タロウ' }
    user_birth_date { Faker::Date.birthday(min_age: 10, max_age: 90) }
  end
end
