class CreateNetworks < ActiveRecord::Migration[8.0]
  def change
    create_table :networks do |t|
      t.string :name, null: false
      t.string :status, null: false, default: "active"

      t.timestamps
    end
  end
end
