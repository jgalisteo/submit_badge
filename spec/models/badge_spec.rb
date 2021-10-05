# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Badge, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:name) }
  end

  describe '#to_sha256' do
    let(:badge) { create(:badge) }

    it 'returns a hash based on id, date and name' do
      expected_hash = Digest::SHA256.hexdigest "#{badge.id}#{badge.date}#{badge.name}"

      expect(badge.to_sha256).to eq expected_hash
    end
  end
end
