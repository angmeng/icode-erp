class AddPurchaseRequisitionIdToPurchaseOrder < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :purchase_requisition_id, :integer
    change_column :purchase_orders, :revision, :integer, :default => 0
  end
end
