# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Badge, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
