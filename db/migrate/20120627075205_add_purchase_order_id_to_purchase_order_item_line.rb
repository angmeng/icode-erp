class AddPurchaseOrderIdToPurchaseOrderItemLine < ActiveRecord::Migration
  def change
    add_column :purchase_order_item_lines, :purchase_order_id, :integer
    add_index  :purchase_order_item_lines, :purchase_order_id
  end
end
