require 'rails_helper'

RSpec.describe RegisterController, type: :controller do
  describe 'POST #create' do
    let(:user_params) { { first_name: 'bob', last_name: 'ross', email: 'bross@email.com', password: 'password', password_confirmation: 'password' } }

    it 'should return http successful' do
      post :create, params: user_params
      expect(response).to be_successful
    end
  end
end