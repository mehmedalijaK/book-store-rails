class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  accepts_nested_attributes_for :order_items
  validates :status, :ordered_at, :scheduled_at, :address, :phone, :full_name, presence: true
  validate :valid_status
  validate :must_have_order_items

  def valid_status
    unless ["Processing", "Shipped", "Delivered", "Cancelled"].include?(status)
      errors.add(:status, "is not a valid status")
    end
  end

  def must_have_order_items
    if order_items.empty?
      errors.add(:base, "Order must have at least one order item")
    end
  end
end
