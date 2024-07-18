class CreatePhoneNumbers < ActiveRecord::Migration[8.0]
  def change
    create_table :phone_numbers do |t|
      t.string :number
      t.boolean :sms
      t.references :callable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
