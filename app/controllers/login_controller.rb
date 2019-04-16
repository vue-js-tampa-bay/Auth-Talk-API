# frozen_string_literal: true

class LoginController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      auth_token = Auth.generate(user_id: user.id, first_name: user.first_name)
      render json: { auth_token: auth_token }
    else
      render json: { errors: ['Cannot log it', 'Unauthorized'] }, status: :unauthorized
    end
  end
end
