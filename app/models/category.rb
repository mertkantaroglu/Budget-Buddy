class Category < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  has_many :expenses

  validates :name, presence: true, length: {in: 3..20}, uniqueness: true
  validates :icon, presence: true
end
