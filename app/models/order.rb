class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_one :payments
end
