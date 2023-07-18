class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :title, null: false, unqiue: true

      t.timestamps
    end
  end
end
