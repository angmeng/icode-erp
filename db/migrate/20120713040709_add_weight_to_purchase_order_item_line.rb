class AddWeightToPurchaseOrderItemLine < ActiveRecord::Migration
  def change
    add_column :purchase_order_item_lines, :weight, :float, :default => 0
  end
end
