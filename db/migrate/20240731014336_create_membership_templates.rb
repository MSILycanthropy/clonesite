class CreateMembershipTemplates < ActiveRecord::Migration[8.0]
  def change
    create_table :membership_templates do |t|
      t.string :name, null: false
      t.boolean :trial, null: false, default: false
      t.string :end_behavior, null: false, default: "cancel"
      t.string :duration_type, null: false, default: "ongoing"
      t.integer :term_length
      t.string :term_interval
      t.string :billing_type, null: false, default: "recurring"
      t.decimal :price, null: false, precision: 21, scale: 3, default: 0
      t.decimal :late_fee, null: false, precision: 21, scale: 3, default: 0
      t.decimal :registration_fee, null: false, precision: 21, scale: 3, default: 0
      t.decimal :cancellation_fee, null: false, precision: 21, scale: 3, default: 0
      t.integer :recurring_billing_length
      t.string :recurring_billing_interval
      t.integer :recurring_billing_payments
      t.string :attendance_type, null: false, default: "unlimited"
      t.integer :attendance_amount
      t.string :attendance_interval

      t.references :network, null: false, foreign_key: true
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
