require 'rails_helper'
require 'order'
RSpec.describe Order, type: :model do
  context 'Relationship' do
    it 'belongs to one user' do
      is_expected.to belong_to(:user)
    end

    it 'belongs to one order status' do
      is_expected.to belong_to(:order_status)
    end

    it 'have many order items' do
      is_expected.to have_many(:order_items)
    end
  end
end
