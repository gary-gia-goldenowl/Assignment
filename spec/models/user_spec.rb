require 'rails_helper'
require 'user'
RSpec.describe User, type: :model do
  context 'Validation field' do
    it 'ensures email should be presence' do
      is_expected.to validate_presence_of(:email)
    end

    it 'ensures password length minumum 6 characters' do
      is_expected.to validate_length_of(:password).is_at_least(6)
    end

    it 'ensures password confirmation is valid' do
      is_expected.to validate_confirmation_of(:password)
    end
  end

  context 'methods' do
    let!(:user) do
      User.create(email: 'Gia', username: 'Ha Gia Huy', password: 'abc@gmail.com',
                  password_confirmation: 'abc@gmail.com')
    end

    let!(:auth) do
      {
        provider: 'facebook',
        uid: '123456',
        info: OpenStruct.new({
                               name: 'user1',
                               email: 'abc@gmail.com',
                               image: ''
                             })
      }.with_indifferent_access
    end

    it 'confirmation_required?' do
      expect(user.confirmation_required?).to eq false
    end

    it 'login' do
      expect(user.login).to eq user.username
    end

    it 'self.from_omniauth' do
      expect do
        User.from_omniauth(OpenStruct.new(auth))
      end.to change(User, :count).by(1)
    end
  end

  context 'Relationship' do
    it { is_expected.to have_many(:orders) }
  end
end
