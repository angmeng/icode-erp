class ChangeColumnToProductId < ActiveRecord::Migration
  def change
    change_column(:purchase_order_items, :part_weight, :decimal, {:default => 0.000000, :scale => 6, :precision => 10 })
    change_column(:purchase_order_items, :selling_price, :decimal, {:default => 0.00000, :scale => 5, :precision => 10 })
    change_column(:purchase_order_items, :opening_stock, :decimal, {:default => 0.00, :scale => 2, :precision => 10 })
    change_column(:purchase_order_items, :current_stock, :decimal, {:default => 0.00, :scale => 2, :precision => 10 })
  end
end
