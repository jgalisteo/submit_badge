# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'badges#index'

  resources :badges, except: %i[edit update]
  resources :submits, only: %i[create] do
    get :success, on: :member
    get :failure, on: :member
  end
end
