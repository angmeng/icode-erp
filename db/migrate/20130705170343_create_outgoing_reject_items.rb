class CreateOutgoingRejectItems < ActiveRecord::Migration
  def change
    create_table :outgoing_reject_items do |t|
      t.integer :delivery_order_item_id
      t.integer :quantity
      t.integer :received_qty
      t.integer :invoice_delivery_qty
      t.float :invoice_unit_price, :precision => 10, :scale => 2, :default => 0.00
      t.integer :so_balance_qty
      t.integer :status, :default => 1
      t.integer :current_stock
      t.string :client_lot
      t.string :client_part
      t.string :client_po

      t.timestamps
    end
    add_index :outgoing_reject_items, :delivery_order_item_id
  end
end