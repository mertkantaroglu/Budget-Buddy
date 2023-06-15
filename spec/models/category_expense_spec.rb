require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create(name: 'Mert', email: 'mk@gmail.com', password: 'mert1234')
    @category = Category.create(name: 'Home', icon: 'www.unsplash.com', user_id: @user.id)
    @expense = Expense.create(name: 'Cleaning', amount: 50, author_id: @user.id)
  end

  describe 'Testing Validations' do
    it 'should be valid' do
      expect(@expense).to be_valid
    end

    it 'should be valid' do
      expect(@category).to be_valid
    end

    it 'should allow valid user_id' do
      @category.user_id = nil
      expect(@category).to_not be_valid
    end

    it 'should allow valid author_id' do
      @expense.author_id = nil
      expect(@expense).to_not be_valid
    end
  end
end
