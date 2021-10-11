require 'rails_helper'

RSpec.describe SubmitBadgeService do
  let(:badge) { create(:badge) }
  let(:proof_id) { 'proof_id' }
  let(:response) { {'hashes' => [{'proof_id' => proof_id}]} }
  let(:post_hash_instance) { instance_double('PostHashService', run: response) }
  let(:post_hash_service) do
    class_double('PostHashService', new: post_hash_instance).as_stubbed_const
  end

  subject(:service) { described_class.new(badge, post_hash_service) }

  it 'updates badge with proof_id' do
    service.run

    badge.reload

    expect(badge.proof_id).to eq proof_id
  end
end
