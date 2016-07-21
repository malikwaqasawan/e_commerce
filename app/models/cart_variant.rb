class CartVariant < ApplicationRecord
  belongs_to :cart
  belongs_to :variant
end
