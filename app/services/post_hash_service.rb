class PostHashService
  ENDPOINT = URI.join(ENV.fetch('CHAINPOINT_URL'), 'hashes')

  HEADERS = {
    'Accept' => 'application/json',
    'Content-Type' => 'application/json'
  }.freeze

  attr_reader :hash

  def initialize(hash)
    @hash = hash
  end

  def run
    JSON.parse(Net::HTTP.post(ENDPOINT, body, HEADERS).body)
  end

  private

  def body
    {hashes: [hash]}.to_json
  end
end
