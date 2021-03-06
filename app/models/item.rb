class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :buy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_info, presence: true

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :category_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :status_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :shipping_fee_status_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :scheduled_delivery_id, numericality: { other_than: 1, message: "を選択してください" }
end
