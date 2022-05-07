require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'Ricky', email: 'rickymormor1@mail.com', password: 'railsrails') }
  let(:category) { Category.create(name: 'Shopping', icon: 'https://i.imgur.com/Ar3Lf3Dt.png', author_id: user.id) }

  describe 'Validations' do
    context 'when valid' do
      it { expect(category).to be_valid }
    end

    it 'should allow valid name' do
      category.name = 'Ricky'
      expect(category).to be_valid
    end

    it 'should allow valid author_id' do
      category.author_id = nil
      expect(category).to_not be_valid
    end
  end
end