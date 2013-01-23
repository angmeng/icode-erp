# start rollback 23/1/2013
# close rollback 
class AddRecoverStatusToPurchaseRequisition < ActiveRecord::Migration
  def change
    add_column :purchase_requisitions, :recover_status, :string
    add_column :purchase_requisition_items, :skip_to_purchase_order, :boolean, :default => false
  end
end
