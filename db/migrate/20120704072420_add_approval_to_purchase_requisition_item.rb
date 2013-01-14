class AddApprovalToPurchaseRequisitionItem < ActiveRecord::Migration
  def change
    add_column :purchase_requisition_items, :approval_proposed, :boolean, :default => false
  end
end
