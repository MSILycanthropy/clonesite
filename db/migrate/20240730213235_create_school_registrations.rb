class CreateSchoolRegistrations < ActiveRecord::Migration[8.0]
  def change
    create_table :school_registrations do |t|
      t.references :member, null: false, foreign_key: true
      t.references :school, null: false, foreign_key: true
      t.references :network, null: false, foreign_key: true

      t.timestamps
    end
  end
end
