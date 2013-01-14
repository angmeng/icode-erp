class AddUserIdToPurchaseRequisitionItem < ActiveRecord::Migration
  def change
    add_column :purchase_requisition_items, :user_id, :integer
  end
end
