class Item < ApplicationRecord
  has_one :order
  belongs_to :user
  belongs_to_active_hash :category_id, :condition_id, :shipping_fee_id, :shipping_area_id,:shipping_date_id


end

with_options presence:true do
  validates :name , :description

  validetes :category_id, :condition_id, :shipping_fee_id, :shipping_area_id,
            :shipping_date_id, format {with: greater_than_or_equal_to:1}
  
  validetes :price, format{with: greater_than: 300, less_than: 9999999}, numericality: {only_integer: true }
end