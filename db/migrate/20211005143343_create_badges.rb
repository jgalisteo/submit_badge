# frozen_string_literal: true

class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.date :date
      t.string :name

      t.timestamps
    end
  end
end
