class Product < ApplicationRecord
	has_one :variant
  has_many  :images, as: :imageable

end
