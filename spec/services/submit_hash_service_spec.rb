require 'rails_helper'

RSpec.describe SubmitHashService do
  let(:transport) { class_double('Transport') }
  let(:resource) { double('resource', to_sha256: 'SHA256 hash') }

  subject(:service) { described_class.new(transport, resource) }

  it '#run!' do
    uri = URI.join(ENV.fetch('CHAINPOINT_URL'), 'hashes')
    body = {hashes: [resource.to_sha256]}.to_json
    headers = {
      'Accept' => 'application/json',
      'Content-Type' => 'application/json'
    }

    expect(transport).to receive(:post).with(uri, body, headers)

    service.run!
  end
end
