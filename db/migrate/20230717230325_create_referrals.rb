class CreateReferrals < ActiveRecord::Migration[7.0]
  def change
    create_table :referrals do |t|
      t.integer :referee_id, null: false
      t.integer :referer_id, null: false
      t.integer :organization_id, null: false
      t.timestamps
    end
  end
end
