class AddApprovalProposedRemarkToPurchaseRequisitionItem < ActiveRecord::Migration
  def change
    add_column :purchase_requisition_items, :approval_remark, :string
  end
end
