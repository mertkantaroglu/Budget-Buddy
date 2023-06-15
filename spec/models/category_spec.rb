require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create(name: 'Mert', email: 'mk@gmail.com', password: 'mert1234')
    @category = Category.create(name: 'Home', icon: 'www.unsplash.com', user_id: @user.id)
  end

  describe 'Testing Validations' do
    it 'should be valid' do
      expect(@category).to be_valid
    end

    it 'should have a name for category' do
      expect(@category.name).to eql('Home')
    end

    it 'should have a valid icon url' do
      @category.icon = nil
      expect(@category).to_not be_valid
    end

    it 'should have a user id' do
      expect(@category.user_id).to be_present
    end
  end

  describe 'Testing associations' do
    it 'category should belong to a user' do
      @category = Category.reflect_on_association(:user)
      expect(@category.macro).to eql(:belongs_to)
    end
  end
end
