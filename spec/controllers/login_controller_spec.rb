require 'rails_helper'

RSpec.describe LoginController, type: :controller do
  describe 'POST #create' do
    let(:password) { 'password' }
    let(:user) { create(:user) }
    let(:user_params) { { first_name: user.first_name, last_name: user.last_name, email: user.email, password: user.password } }

    it 'should return http success' do
      post :create, params: user_params
      expect(response).to be_successful
      body = JSON.parse(response.body)
      expect(body.keys).to eq ['auth_token', 'first_name', 'last_name', 'email']
    end

    it 'should return unauthorized for invalid params' do
      post :create, params: { first_name: user.first_name, last_name: user.last_name, email: user.email, password: 'notmypassword' }
      expect(response).to have_http_status(401)
    end
  end
end