class AddNetworkToEverything < ActiveRecord::Migration[8.0]
  def change
    remove_reference :members, :school, index: true, foreign_key: true
    remove_reference :phone_numbers, :school, index: true
    remove_reference :email_addresses, :school, index: true

    add_reference :members, :network, index: true, foreign_key: true
    add_reference :schools, :network, index: true, foreign_key: true
    add_reference :phone_numbers, :network, index: true, foreign_key: true
    add_reference :email_addresses, :network, index: true, foreign_key: true
  end
end
