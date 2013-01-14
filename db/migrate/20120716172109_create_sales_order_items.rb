class CreateSalesOrderItems < ActiveRecord::Migration
  def change
    create_table :sales_order_items do |t|
      t.integer :sales_order_id
      t.integer :product_id
      t.string :description
      t.integer :quantity
      t.integer :unit_measurement_id
      t.date :eta
      t.float :unit_price
      t.string :status
      t.string :customer_po
      t.integer :part_no
      t.integer :current_stock
      t.integer :complete_qty

      t.timestamps
    end
    
    add_index :sales_order_items, :sales_order_id
    add_index :sales_order_items, :product_id
    add_index :sales_order_items, :unit_measurement_id
  end
end
