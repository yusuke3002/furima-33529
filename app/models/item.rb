class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_days

  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    with_options numericality: { other_than: 1, message: "Please select an item" } do
      validates :category_id
      validates :state_id
      validates :delivery_charge_id
      validates :prefecture_id
      validates :delivery_days_id
    end
    validates :price, numericality: { only_integer: true, message: "Please use half-width numbers" }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 10000000, message: "Please set the price range between ¥300 and ¥9,999,999" }
  end
end
