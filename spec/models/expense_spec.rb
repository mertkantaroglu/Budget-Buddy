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

    it 'should not be valid if name is not provided' do
      @expense.name = nil
      expect(@expense).to_not be_valid
    end

    it 'should give the right number for the amount' do
      expect(@expense.amount).to eql 50
    end
  end

  describe 'Testing associations' do
    it 'expense should belong to a user' do
      @expense = Expense.reflect_on_association(:author)
      expect(@expense.macro).to eql(:belongs_to)
    end
  end
end
