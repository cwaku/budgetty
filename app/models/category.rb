class Category < ApplicationRecord
  belongs_to :user
  has_many :expenses, through: :categories_expenses
  has_many :categories_expenses

  validates :name, presence: true, length: { maximum: 50 }
  validates :icon, presence: true
end
