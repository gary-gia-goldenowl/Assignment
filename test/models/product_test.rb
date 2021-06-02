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
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
