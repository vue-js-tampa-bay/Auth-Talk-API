# frozen_string_literal: true

Rails.application.routes.draw do
  resources :todos
  resources :register, only: %i[create]
  resources :login, only: %i[create]
end
