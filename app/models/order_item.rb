# == Schema Information
#
# Table name: order_items
#
#  id          :integer          not null, primary key
#  product_id  :integer          not null
#  order_id    :integer          not null
#  unit_price  :decimal(12, 3)
#  quantity    :integer
#  total_price :decimal(12, 3)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present

  before_save :finalize

  def per_product_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def sum_price
    unit_price * quantity
  end

  private

  def product_present
    errors.add(:product, 'is not valid or is not active.') if product.nil?
  end

  def order_present
    errors.add(:order, 'is not a valid order.') if order.nil?
  end

  def finalize
    self[:unit_price] = per_product_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
