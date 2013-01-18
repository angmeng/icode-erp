class AddRecoverStatusToPurchaseRequisition < ActiveRecord::Migration
  def change
    add_column :purchase_requisitions, :recover_status, :string
  end
end
