require 'rails_helper'

RSpec.describe Payment, type: :model do
  before do
    @user = User.create!(name: 'Test', email: 'a@b.c', password: '000000')
    @group = Group.create!(user_id: @user.id, name: 'Test Category', icon: 'Icon.png')
  end

  describe 'Group validations' do
    it 'is valid with valid attributes' do
      expect(@group).to be_valid
    end

    it 'is not valid without a name' do
      @group.name = nil
      expect(@group).to_not be_valid
    end

    it 'is invalid if name length is more than 100 characters' do
      @group.name = 'name' * 26
      expect(@group).to_not be_valid
    end

    it 'is invalid without an icon' do
      @group.icon = nil
      expect(@group).to_not be_valid
    end

    it 'is not valid without a user' do
      @group.user_id = nil
      expect(@group).to_not be_valid
    end
  end
end
