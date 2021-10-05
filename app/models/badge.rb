# frozen_string_literal: true

class Badge < ApplicationRecord
  validates :date, presence: true
  validates :name, presence: true
end
