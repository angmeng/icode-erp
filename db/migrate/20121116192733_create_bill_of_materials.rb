class CreateBillOfMaterials < ActiveRecord::Migration
  def change
    create_table :bill_of_materials do |t|
      t.integer :bom_no
      t.string :type
      t.integer :sales_order_item_id
      t.date    :bom_date
      t.string :other_type

      t.timestamps
    end
    add_index :bill_of_materials, :sales_order_item_id
  end
end
