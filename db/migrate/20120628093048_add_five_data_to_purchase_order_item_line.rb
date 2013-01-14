class AddFiveDataToPurchaseOrderItemLine < ActiveRecord::Migration
  def change
    add_column :purchase_order_item_lines, :vendor_delivery_no, :integer
    add_column :purchase_order_item_lines, :licence_no, :string
    add_column :purchase_order_item_lines, :rn_qty, :integer, :default => 0
    add_column :purchase_order_item_lines, :ir_qty, :integer, :default => 0
    add_column :purchase_order_item_lines, :vendor_part_no, :integer
  end
end
