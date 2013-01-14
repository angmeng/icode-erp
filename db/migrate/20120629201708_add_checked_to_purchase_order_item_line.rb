class AddCheckedToPurchaseOrderItemLine < ActiveRecord::Migration
  def change
    add_column :purchase_order_item_lines, :checked, :boolean, :default => false
  end
end
