class CreatePhoneNumbers < ActiveRecord::Migration[8.0]
  def change
    create_table :phone_numbers do |t|
      t.string :number, null: false
      t.boolean :sms, null: false, default: false
      t.references :callable, polymorphic: true, null: false
      t.references :school, null: false

      t.timestamps
    end
  end
end
