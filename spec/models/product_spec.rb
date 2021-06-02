require 'rails_helper'
require 'product'
RSpec.describe Product, type: :model do
  context 'Validate presence' do
    it 'ensures name presence' do
      is_expected.to validate_presence_of(:name)
    end

    it 'ensures description presence' do
      is_expected.to validate_presence_of(:description)
    end

    it 'ensures price presence' do
      is_expected.to validate_presence_of(:price)
    end
  end

  context 'Relationship' do
    it 'belongs to one category' do
      is_expected.to belong_to(:category)
    end

    it 'have many order items' do
      is_expected.to have_many(:order_items)
    end
  end
end
