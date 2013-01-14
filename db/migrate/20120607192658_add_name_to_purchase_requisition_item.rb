class AddNameToPurchaseRequisitionItem < ActiveRecord::Migration
  def change
    add_column :purchase_requisition_items, :trade_company_new_name, :string
  end
end
