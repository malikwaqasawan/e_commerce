class Product < ApplicationRecord
	has_many :variants
  has_many  :images, as: :imageable
  accepts_nested_attributes_for :images

end
