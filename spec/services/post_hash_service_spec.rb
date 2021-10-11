require 'rails_helper'

RSpec.describe PostHashService do
  let(:response_body) { {'hashes' => [{'proof_id' => 'proof_id'}]} }
  let(:response) { double('response', body: response_body.to_json) }
  let!(:transport) { class_double('Net::HTTP', post: response).as_stubbed_const }
  let(:hash) { 'hash' }

  subject(:service) { described_class.new(hash) }

  describe '#run' do
    it 'calls transport#post with correct args' do
      uri = URI.join(ENV.fetch('CHAINPOINT_URL'), 'hashes')
      body = {hashes: [hash]}.to_json
      headers = {
        'Accept' => 'application/json',
        'Content-Type' => 'application/json'
      }

      expect(transport).to receive(:post).with(uri, body, headers)

      service.run
    end

    it 'returns chainpoint response' do
      expect(service.run).to eq response_body
    end
  end
end
