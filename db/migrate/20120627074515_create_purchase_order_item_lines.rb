class CreatePurchaseOrderItemLines < ActiveRecord::Migration
  def change
    create_table :purchase_order_item_lines do |t|
      t.integer :purchase_requisition_item_id

      t.timestamps
    end
    add_index :purchase_order_item_lines, :purchase_requisition_item_id
  end
end
