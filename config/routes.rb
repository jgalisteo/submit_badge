# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'badges#index'

  resources :badges, except: %i[edit update]
end
