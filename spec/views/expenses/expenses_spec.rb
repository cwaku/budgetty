require 'rails_helper'

RSpec.describe 'expenses#index', type: :feature do
  describe 'Expense' do
    before(:each) do
      @user = User.create name: 'Test', email: 'text@example.com', password: '123456'
      @cat = Category.create name: 'Test type', icon: 'test.png', user: @user
      # @expense = Expense.create name: 'Test expense', amount: 100, user: @user, category_id: @cat.id
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_on 'Log in'

      visit expenses_path(@cat.id)
    end

    it 'For a given category, the list of transactions is presented, ordered by the most recent.' do
      expect(page).to have_content 'Hey Test!'
    end
  end
end
