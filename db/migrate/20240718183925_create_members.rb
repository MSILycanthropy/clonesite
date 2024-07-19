class CreateMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :members do |t|
      t.references :school, null: false, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name

      t.timestamps
    end
  end
end
