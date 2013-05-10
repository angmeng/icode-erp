class AddColumnToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :shotcut_name, :string
  end
end
