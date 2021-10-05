# frozen_string_literal: true

class Badge < ApplicationRecord
  validates :date, presence: true
  validates :name, presence: true

  def to_sha256
    Digest::SHA256.hexdigest "#{id}#{date}#{name}"
  end
end
