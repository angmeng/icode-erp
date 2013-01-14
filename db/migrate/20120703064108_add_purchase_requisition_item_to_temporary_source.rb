class AddPurchaseRequisitionItemToTemporarySource < ActiveRecord::Migration
  def change
    add_column :temporary_sources, :purchase_requisition_item_id, :integer
    add_index  :temporary_sources, :purchase_requisition_item_id
  end
end
