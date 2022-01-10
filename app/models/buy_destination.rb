class BuyDestination
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postcode, :prefecture_id, :city, :addresses, :building, :phone_number

  with_options presence: true do
    validates :token
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は無効です。以下のように入力してください(例: 123-4567)"}
    validates :city
    validates :addresses
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "は無効です。数字のみ入力してください"}
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }

  def save
    @buy = Buy.create(user_id: user_id, item_id: item_id)
    Destination.create(postcode: postcode, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, buy_id: @buy.id)
  end
end