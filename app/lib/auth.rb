# frozen_string_literal: true

require 'jwt'

class Auth
  ALGORITHM = 'HS256'

  def self.secret_key
    Rails.application.credentials.auth_key
  end

  def self.generate(payload)
    JWT.encode(payload, secret_key, ALGORITHM)
  end

  def self.decode(token)
    JWT.decode(token, secret_key)
  end
end
