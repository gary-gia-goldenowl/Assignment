# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  has_many_attached :photos

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
