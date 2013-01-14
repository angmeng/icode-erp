class CreateDeliveryOrderItems < ActiveRecord::Migration
  def change
    create_table :delivery_order_items do |t|
      t.integer :sales_order_item_id
      t.date :so_date
      t.integer :delivery_qty, :default => 0
      t.integer :order_qty, :default => 0
      t.float :unit_price, :default => 0.0000, :precision => 4, :scale => 10
      t.integer :balance_qty, :default => 0
      t.integer :no_of_carton
      t.integer :gen_current_stock
      t.string :do_status
      t.string :part_no
      t.string :client_lot
      t.string :client_po
      t.string :department
      t.integer :dept_current_stock
      t.integer :delivery_order_id
      

      t.timestamps
    end
    
    add_index :delivery_order_items, :delivery_order_id
    add_index :delivery_order_items, :sales_order_item_id
    
  end
end
