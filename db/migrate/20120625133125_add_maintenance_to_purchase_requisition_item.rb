class AddMaintenanceToPurchaseRequisitionItem < ActiveRecord::Migration
  def change
    add_column :purchase_requisition_items, :maintenance, :boolean, :default => false
  end
end
