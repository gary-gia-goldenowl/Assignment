# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  category_id :integer
#  name        :string
#  description :string
#  price       :decimal(, )
#  photos      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  active      :boolean
#  bestseller  :boolean
#
class Product < ApplicationRecord
  self.per_page = 8
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
