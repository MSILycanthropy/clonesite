class CreateSchools < ActiveRecord::Migration[8.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :subdomain
      t.string :timezone
      t.string :status

      t.timestamps
    end
  end
end
