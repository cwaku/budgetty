require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    before do
      @user = User.new(name: 'Example User', email: 'rickymormor1@gmail.com', password: 'foobar')
      @category = Category.new(name: 'Example Category', user_id: @user.id, icon: 'icon')
      @category.save
    end

    it 'validates presence of name' do
      @category.name = nil
      expect(@category).to_not be_valid
      end

    it 'validates presence of user_id' do
      @category.user_id = nil
      expect(@category).to_not be_valid
    end

    it 'validates presence of icon' do
      @category.icon = nil
      expect(@category).to_not be_valid
    end

    it 'validates name is correct' do
      @category.name = 'a'
      expect(@category).to_not be_valid
    end
end
end
