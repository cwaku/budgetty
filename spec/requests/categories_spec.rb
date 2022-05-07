require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /categories' do
    before(:each) do
      @user = User.create(name: 'Ricky', email: 'ricky1@gmail.com', password: 'password')
      @category1 = Category.create(user: @user, name: 'Clothes', icon: 'icon')

      post user_session_path, params: { user: { email: @user.email, password: @user.password } }
      get root_path
    end

    it 'returns http success' do
      get categories_path
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get categories_path
      expect(response).to render_template('index')
    end
  end
end
