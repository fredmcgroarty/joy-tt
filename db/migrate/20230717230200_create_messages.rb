class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :body, null: false
      t.integer :sender_id, null: false
      t.integer :recipient_id, null: false
      t.integer :referral_id

      t.timestamps
    end

    add_index :messages, [:recipient_id, :referral_id], unique: true
  end
end
