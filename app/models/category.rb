class Category < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  has_many :category_expenses, dependent: :destroy
  has_many :expenses, through: :category_expenses, dependent: :destroy

  validates :name, presence: true, length: { in: 3..20 }, uniqueness: true
  validates :icon, presence: true
end
