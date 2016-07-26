class Product < ApplicationRecord
	has_one :variant
  has_many  :images, as: :imageable
  accepts_nested_attributes_for :images

end
