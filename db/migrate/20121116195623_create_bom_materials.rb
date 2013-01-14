class CreateBomMaterials < ActiveRecord::Migration
  def change
    create_table :bom_materials do |t|
      t.integer :material_id
      t.integer :bill_of_material_id
      
      t.integer :quantity
      t.integer :unit_measurement_id
      t.string :remark

      t.timestamps
    end
    add_index :bom_materials, :material_id
    add_index :bom_materials, :bill_of_material_id
    add_index :bom_materials, :unit_measurement_id
  end
end
