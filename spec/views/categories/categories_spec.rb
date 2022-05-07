require 'rails_helper'

RSpec.describe 'categories', type: :feature do
  describe 'category' do
    before(:each) do
      @user = User.create(name: 'Ricky', email: 'ricky1@gmail.com', password: 'password')
      visit new_user_session_path
      fill_in 'Email', with: 'ricky1@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'

      @category1 = Category.create(user: @user, name: 'Clothes', icon: 'icon')
      @category2 = Category.new(user: @user, name: 'Drinks', icon: 'icon')
      @category3 = Category.new(user: @user, name: 'Cereals', icon: 'icon')
      @category4 = Category.new(user: @user, name: 'Leisure', icon: 'icon')

      visit(categories_path)
    end

    it 'displays name of the category' do
      expect(page).to have_content('Clothes')
    end

    it 'displays amount' do
      expect(page).to have_content('0')
    end
  end
end
