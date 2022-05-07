require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'Ricky', email: 'rickymormor1@mail.com', password: 'railsrails') }
  let(:category) { Category.create(name: 'Shopping', icon: 'https://i.imgur.com/Ar3Lf3Dt.png', author_id: user.id) }
  let(:expense) { Expense.create(name: 'Suit', amount: 12, author_id: user.id) }
  let(:expense_category) { ExpenseCategory.create(category_id: category.id, expense_id: expense.id) }

  describe 'Validations' do
    context 'when valid' do
      it { expect(expense).to be_valid }
    end

    it 'valid expense_category' do
      expect(expense_category).to be_valid
    end

    it 'should valid name ' do
      expense.name = nil
      expect(expense).to_not be_valid
    end
    it 'should valid amount ' do
      expense.amount = -10
      expect(expense).to_not be_valid
    end
    it 'should valid amount ' do
      expense.amount = 10
      expect(expense).to be_valid
    end
  end
end