require 'rails_helper'

RSpec.describe Payment, type: :model do
  before(:each) do
    @user = User.create(name: 'Test', email: 'test@test.com', password: '000000')
    @group = Group.create(icon: 'icon.png', name: 'category1', user_id: @user.id)
    @payment = Payment.create(name: 'trans1', amount: '100', group_id: @group.id, user_id: @user.id)
  end

  describe 'Transaction validations' do
    it 'is valid with valid attributes' do
      expect(@payment).to be_valid
    end

    it 'is not valid without a name' do
      @payment.name = nil
      expect(@payment).to_not be_valid
    end

    it 'is invalid if name length is more than 100 characters' do
      @payment.name = 'name' * 26
      expect(@payment).to_not be_valid
    end

    it 'is not valid without a user' do
      @payment.user_id = nil
      expect(@payment).to_not be_valid
    end

    it 'is not valid without an amount' do
      @payment.amount = nil
      expect(@payment).to_not be_valid
    end
  end
end
