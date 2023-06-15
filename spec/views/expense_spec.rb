require 'rails_helper'

RSpec.describe 'Expenses Views', type: :feature do
  describe 'after log in' do
    before(:each) do
      @user1 = User.create(name: 'Mert', email: 'mk@gmail.com', password: 'mert1234')
      @category1 = Category.create(name: 'Car', icon: 'www.unsplash.com', user_id: @user1.id)

      visit 'users/sign_in'
      fill_in 'Email', with: 'mk@gmail.com'
      fill_in 'Password', with: 'mert1234'
      click_on 'Log in'

      visit category_path(@category1)
    end

    it 'displays the category name on the expenses page' do
      expect(page).to have_content('Add New Expense')
    end

    it 'displays Save button to add the expense' do
      visit new_category_expense_path(@category1)

      within('body') do
        expect(page).to have_button('Save')
      end
    end
  end
end
