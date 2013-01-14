class AddReceivedQtyToPurchaseOrderItemLine < ActiveRecord::Migration
  def change
    add_column :purchase_order_item_lines, :received_qty, :integer, :default => 0
  end
end
