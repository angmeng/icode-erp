class AddStatusToPurchaseRequisitionItem < ActiveRecord::Migration
  def change
    add_column :purchase_requisition_items, :status, :string
  end
end
