# frozen_string_literal: true

class Product < ApplicationRecord
  self.per_page = 10
  belongs_to :category
  has_many_attached :photos
  has_many :order_items

  default_scope { where(active: true) }

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  def self.search(search)
    where('category_id LIKE ?', "%#{search}")
  end
end
