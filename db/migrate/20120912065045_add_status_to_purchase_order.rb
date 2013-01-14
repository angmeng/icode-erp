class AddStatusToPurchaseOrder < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :status, :string, :default => PurchaseOrder::ACTIVE
  end
end
