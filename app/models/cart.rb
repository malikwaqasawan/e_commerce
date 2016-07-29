class Cart < ApplicationRecord

	belongs_to :user
	has_many :cart_variants
	has_many :variants, through: :cart_variants

  def total_price
    total_amount = 0
    self.cart_variants.each do |cart_variant|
    total_amount += ( (cart_variant.variant.product.price)*(cart_variant.quantity) )
    end
    total_amount
  end

end
