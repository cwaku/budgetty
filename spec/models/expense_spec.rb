require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'validations' do
    before do
      @user = User.new(name: 'Example User', email: 'rickymormor1@gmail.com', password: 'foobar')
      @expense = Expense.new(name: 'Example Expense', amount: 100, user_id: 1)
      @expense.save
    end

    it 'validates presence of name' do
      @expense.name = nil
      expect(@expense).to_not be_valid
    end

    it 'validates presence of amount' do
      @expense.amount = nil
      expect(@expense).to_not be_valid
    end

    it 'checks i amount is greater than 0' do
      @expense.amount = -1
      expect(@expense).to_not be_valid
    end

    it 'validates presence of user_id' do
      @expense.user_id = nil
      expect(@expense).to_not be_valid
    end

    it 'validates numericality of amount' do
      @expense.amount = 'a'
      expect(@expense).to_not be_valid
    end
  end
end
