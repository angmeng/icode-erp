class AddRemarkToPurchaseRequisition < ActiveRecord::Migration
  def change
    add_column :purchase_requisitions, :remark, :string
  end
end
