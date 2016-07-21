class Cart < ApplicationRecord
	belongs_to :user
	has_many :cart_variants
	has_many :variants, through: :cart_variants
end
