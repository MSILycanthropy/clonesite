class CreateSchools < ActiveRecord::Migration[8.0]
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.string :subdomain, null: false
      t.string :timezone, null: false
      t.string :status, null: false, default: "active"
      t.string :currency, limit: 3, null: false, default: "USD"

      t.timestamps
    end
  end
end
