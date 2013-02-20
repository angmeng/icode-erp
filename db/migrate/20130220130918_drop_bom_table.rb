class DropBomTable < ActiveRecord::Migration
  def change
    drop_table :bill_of_materials
    drop_table :bom_materials
    drop_table :materials
  end
end
