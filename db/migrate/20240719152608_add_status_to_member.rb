class AddStatusToMember < ActiveRecord::Migration[8.0]
  def change
    add_column :members, :status, :string, default: "active"
  end
end
