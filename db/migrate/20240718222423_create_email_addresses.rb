class CreateEmailAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :email_addresses do |t|
      t.string :address, null: false
      t.references :emailable, polymorphic: true, null: false
      t.references :school, null: false

      t.timestamps
    end
  end
end
