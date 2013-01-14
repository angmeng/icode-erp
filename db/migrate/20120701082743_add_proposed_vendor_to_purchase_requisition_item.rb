class AddProposedVendorToPurchaseRequisitionItem < ActiveRecord::Migration
  def change
    add_column :purchase_requisition_items, :proposed_vendor, :boolean, :default => false
  end
end