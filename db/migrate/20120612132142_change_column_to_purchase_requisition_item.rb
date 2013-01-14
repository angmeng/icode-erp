class ChangeColumnToPurchaseRequisitionItem < ActiveRecord::Migration
  def change
    change_column :purchase_requisition_items, :eta, :date
  end
end
