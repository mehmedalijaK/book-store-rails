class OrderItem < ApplicationRecord
  belongs_to :book
  belongs_to :order
  validates :quantity, :price_per_unit, :book_id, presence: true
end
