class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postcode, :prefecture_id, :city, :address, :building, :phone

  POSTCODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/.freeze
  PHONE_REGEX = /\A[0-9]+\z/.freeze

  with_options presence: true do
    validates :postcode, format: { with: POSTCODE_REGEX }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'には全角(漢字・ひらがな・カタカナ)を使用してください' }
    validates :address
    validates :phone, format: { with: PHONE_REGEX }, length: { maximum: 11 }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, order_id: order.id)
  end
  validates :prefecture_id, presence: true, numericality: { greater_than: 1 }
end
