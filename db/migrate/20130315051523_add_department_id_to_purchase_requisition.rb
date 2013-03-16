class AddDepartmentIdToPurchaseRequisition < ActiveRecord::Migration
  def change
    add_column :purchase_requisitions, :department_id, :integer
  end
end
