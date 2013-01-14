class AddKgsToPurchaseOrder < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :kgs, :float, :default => 0
  end
end
