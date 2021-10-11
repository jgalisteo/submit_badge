require 'rails_helper'

RSpec.describe '/submits', type: :request do
  let(:proof_id) { 'proof_id' }
  let(:post_hash_response) { {'hashes' => [{'proof_id' => proof_id}]} }
  let(:post_hash_instance) { instance_double('PostHashService', run: post_hash_response) }
  let!(:post_hash_service) do
    class_double('PostHashService', new: post_hash_instance).as_stubbed_const
  end
  let(:badge) { create(:badge) }

  describe 'POST /create' do
    it 'redirects to success submit page' do
      post submits_url, params: {badge_id: badge.id}

      expect(response).to redirect_to(success_submit_url(badge))
    end
  end

  describe 'GET /:id/success' do
    it 'renders a successful response' do
      get success_submit_url(badge)

      expect(response).to be_successful
    end
  end
end
