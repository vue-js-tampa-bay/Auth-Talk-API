require 'rails_helper'

RSpec.describe RegisterController, type: :controller do
  describe 'POST #create' do
    let(:user_params) { { first_name: 'bob', last_name: 'ross', email: 'bross@email.com', password: 'password', password_confirmation: 'password' } }

    it 'should return http successful' do
      post :create, params: user_params
      expect(response).to be_successful
      body = JSON.parse(response.body)
      expect(body.keys).to eq ['auth_token', 'first_name', 'last_name', 'email']
    end

    it 'should create a new user' do
      expect do
        post :create, params: user_params
      end.to change(User, :count).by(1)
    end

    it 'should return an error if no params' do
      post :create, params: nil
      expect(response).to have_http_status(400)
    end
  end
end