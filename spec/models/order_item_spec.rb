require 'rails_helper'
require 'order_item'
RSpec.describe OrderItem, type: :model do
  context 'Validate presence' do
    it 'ensures quantity presence' do
      is_expected.to validate_presence_of(:quantity)
    end
  end

  context 'Relationship' do
    it 'belongs to one product' do
      is_expected.to belong_to(:product)
    end

    it 'belongs to one order' do
      is_expected.to belong_to(:product)
    end
  end
end
