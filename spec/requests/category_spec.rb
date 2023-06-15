require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET /categories' do
    before(:each) do
      @user = User.create(name: 'Mert', email: 'mk@gmail.com', password: 'mert1234')
      @user.save
      sign_in @user
      @category = Category.create(name: 'Car', icon: 'www.unsplash.com', user_id: @user.id)
    end

    it 'should return http as successful' do
      get categories_path
      expect(response).to have_http_status(:success)
    end

    it 'should render categories/index page' do
      get categories_path
      expect(response).to render_template(:index)
    end

    it 'should renders categories/new page' do
      get new_category_path
      expect(response).to render_template(:new)
    end
  end
end
