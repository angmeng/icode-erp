class AddUserIdToPurchaseRequisition < ActiveRecord::Migration
  def change
    add_column :purchase_requisitions, :tasks, :integer
  end
end
