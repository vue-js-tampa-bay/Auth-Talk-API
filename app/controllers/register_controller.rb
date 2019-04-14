# frozen_string_literal: true

class RegisterController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      auth_token = Auth.generate(user_id: user.id)
      render json: { auth_token: auth_token,
                     first_name: user.first_name,
                     last_name: user.last_name,
                     email: user.email }
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
