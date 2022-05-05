class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :categories, through: :categories_expenses
  has_many :categories_expenses

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
