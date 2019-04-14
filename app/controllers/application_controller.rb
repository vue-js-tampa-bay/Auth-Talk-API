# frozen_string_literal: true

class ApplicationController < ActionController::API
  def authenticate_user
    token = request.headers['Authorization']
    begin
      @decoded = Auth.decode(token)
      @current_user = User.find(@decoded[0]['user_id'])
    rescue StandardError
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
