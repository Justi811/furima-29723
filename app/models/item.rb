class Item < ApplicationRecord
  has_one :order
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :condition, :shipping_fee, :shipping_area,:shipping_date

 validates :name , :description, presence: true


  with_options presence: true, numericality: { other_than:1} do
    validetes :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :shipping_date_id
  end

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}

end