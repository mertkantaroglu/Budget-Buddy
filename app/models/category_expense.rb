class CategoryExpense < ApplicationRecord
  belongs_to :category, foreign_key: 'category_id'
  belongs_to :expense, foreign_key: 'expense_id'
end