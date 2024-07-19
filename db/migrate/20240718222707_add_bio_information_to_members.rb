class AddBioInformationToMembers < ActiveRecord::Migration[8.0]
  def change
    add_column :members, :sex, :string
    add_column :members, :pin, :string, null: false
    add_column :members, :birthday, :date
  end
end
