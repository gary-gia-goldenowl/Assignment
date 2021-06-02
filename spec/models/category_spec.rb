require 'rails_helper'
require 'category'
RSpec.describe Category, type: :model do
  context 'Validation presence category' do
    it 'ensures title should be presence' do
      is_expected.to validate_presence_of(:title)
    end

    it 'ensures description should be presence' do
      is_expected.to validate_presence_of(:description)
    end
  end

  context 'Relationship' do
    it { is_expected.to have_many(:products) }
  end
end
