class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery


  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_info
    validates :price
    validates :user, foreign_key: true
  end
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_fee_status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
