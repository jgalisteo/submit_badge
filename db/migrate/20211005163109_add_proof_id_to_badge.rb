class AddProofIdToBadge < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :proof_id, :string
  end
end
