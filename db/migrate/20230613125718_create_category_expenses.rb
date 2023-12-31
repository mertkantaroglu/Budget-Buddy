class CreateCategoryExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :category_expenses do |t|
      t.references :category, references: :categories, null: false, foreign_key: { to_table: :categories }
      t.references :expense, references: :expenses, null: false, foreign_key: { to_table: :expenses }

      t.timestamps
    end
  end
end
