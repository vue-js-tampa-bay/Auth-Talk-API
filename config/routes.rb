# frozen_string_literal: true

Rails.application.routes.draw do
  resources :register, only: %i[create]
end
