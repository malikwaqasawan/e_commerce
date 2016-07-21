class Variant < ApplicationRecord
  belongs_to :product
  has_many :cart_variants
  has_many :carts, through: :cart_variants
  has_many :order_items
  
end
