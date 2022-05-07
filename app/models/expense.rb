class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expense_categories, dependent: :destroy
  has_many :categories, through: :expense_categories, dependent: :destroy

  validates :name, presence: true
  validates :amount, numericality: { greater_than: 0, less_than: 1_000_000 }
end
