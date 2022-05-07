require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    before do
      @user = User.new(name: 'Example User', email: 'rickymormor1@gmail.com', password: 'foobar')
      @user.save
    end

    it 'validates presence of name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'validates presence of email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end
  end
end
