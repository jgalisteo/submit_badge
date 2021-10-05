class SubmitHashService
  ENDPOINT = URI.join(ENV.fetch('CHAINPOINT_URL'), 'hashes')

  HEADERS = {
    'Accept' => 'application/json',
    'Content-Type' => 'application/json'
  }.freeze

  attr_reader :transport, :resource

  def initialize(transport, resource)
    @transport = transport
    @resource = resource
  end

  def run!
    transport.post ENDPOINT, body, HEADERS
  end

  private

  def body
    {hashes: [hash]}.to_json
  end

  def hash
    resource.to_sha256
  end
end
