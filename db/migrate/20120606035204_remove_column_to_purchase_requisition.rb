class RemoveColumnToPurchaseRequisition < ActiveRecord::Migration
  def change
    remove_column :purchase_requisitions, :purchase_date
    
    change_column :purchase_requisitions, :issued_by, :integer
    add_column    :purchase_requisitions, :issued_date, :date
    
    add_column    :purchase_requisitions, :approved_1_by, :integer
    add_column    :purchase_requisitions, :approved_1_date, :date
    
    add_column    :purchase_requisitions, :approved_2_by, :integer
    add_column    :purchase_requisitions, :approved_2_date, :date
  end
end
