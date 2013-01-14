class AddUrgentToPurchaseRequisitionItem < ActiveRecord::Migration
  def up
    add_column :purchase_requisition_items, :urgent, :boolean, :default => false
  end
  
  def down
    remove_column :purchase_requisition_items, :urgent
  end
end
