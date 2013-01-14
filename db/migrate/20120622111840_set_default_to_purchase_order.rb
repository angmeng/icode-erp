class SetDefaultToPurchaseOrder < ActiveRecord::Migration
  def change
    change_column :purchase_orders, :tax, :integer, :default => 0
    remove_column :purchase_orders, :user_id
    remove_column :purchase_orders, :updated_by
  end
end
