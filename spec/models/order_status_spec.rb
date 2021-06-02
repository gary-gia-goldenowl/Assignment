require 'rails_helper'
require 'order_status'
RSpec.describe OrderStatus, type: :model do
  context 'Validate presence' do
    it 'ensures name presence' do
      is_expected.to validate_presence_of(:name)
    end
  end
  context 'Relationship' do
    it 'has many orders' do
      is_expected.to have_many(:orders)
    end
  end
end
