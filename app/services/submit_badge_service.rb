class SubmitBadgeService
  attr_reader :badge, :post_hash_service

  def initialize(badge, service)
    @badge = badge
    @post_hash_service = service.new(badge.to_sha256)
  end

  def run
    response = post_hash_service.run

    proof_id = response['hashes'].first['proof_id']

    badge.update(proof_id: proof_id)
  end
end
