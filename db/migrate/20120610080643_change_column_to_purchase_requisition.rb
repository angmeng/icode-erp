class ChangeColumnToPurchaseRequisition < ActiveRecord::Migration
  def change
    rename_column :purchase_requisitions, :approved_by_level_four, :approved_by_level_five
    rename_column :purchase_requisitions, :approved_by_level_four_date, :approved_by_level_five_date
  end
end
