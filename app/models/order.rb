class Order < ApplicationRecord
  has_one    :address
  belongs_to :user
  belongs_to :item
  attr_accessor :token

  with_options presence: true do
   validates :address
   validates :description
   validates :image
  end
end