class CreateInventoryManagementSystems < ActiveRecord::Migration
  def change
    create_table :inventory_management_systems do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
