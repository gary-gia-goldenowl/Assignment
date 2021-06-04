class Checkout < ApplicationRecord
  validates :name, presence: true
  validates :phonenumber, presence: true
  validates :email, presence: true
  validates :address, presence: true
end
