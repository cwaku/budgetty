require 'rails_helper'

RSpec.describe 'Category', type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(name: 'Mre Mis', email: 'example@mail.com', password: 'password') }
  let(:category) { user.categories.create(name: 'Shopping', icon: 'https://i.imgur.com/Ar3Lf3Dt.png') }
  let(:expense) { user.expenses.create(name: 'clothes', amount: 20) }
  let(:expense_category) { ExpenseCategory.create(category_id: category.id, expense_id: expense.id) }

  describe 'GET /index' do
    before do
      sign_in user
      get new_category_expense_path(category)
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end
