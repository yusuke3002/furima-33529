class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipalities, :block, :building_name, :phone_number, :token
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "In the correct form with a half-width hyphen" }
    validates :prefecture_id, numericality: { other_than: 1, message: "Please select an item" }
    validates :municipalities
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. An integer of 10 or 11 digits" }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, block: block, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end

