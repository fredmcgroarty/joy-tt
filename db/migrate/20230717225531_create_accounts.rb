class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :email, null: false, unique: true
      t.integer :organization_id

      t.timestamps
    end
  end
end
