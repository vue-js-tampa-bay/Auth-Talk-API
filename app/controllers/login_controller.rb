# frozen_string_literal: true

class LoginController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      auth_token = Auth.generate(user_id: user.id)
      render json: { auth_token: auth_token,
                     first_name: user.first_name,
                     last_name: user.last_name,
                     email: user.email }
    else
      render json: { error: 'Cannot Log In' }, status: :unauthorized
    end
  end
end
