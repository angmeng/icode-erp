class ReworkColumnToPurchaseRequisition < ActiveRecord::Migration
  def change
    remove_column :purchase_requisitions, :issued_by
    remove_column :purchase_requisitions, :issued_date
    remove_column :purchase_requisitions, :approved_1_by
    remove_column :purchase_requisitions, :approved_1_date
    remove_column :purchase_requisitions, :approved_2_by
    remove_column :purchase_requisitions, :approved_2_date
    
    add_column    :purchase_requisitions, :requested_by, :string
    add_column    :purchase_requisitions, :requested_by_date, :date
    add_column    :purchase_requisitions, :approved_by_level_two, :string
    add_column    :purchase_requisitions, :approved_by_level_two_date, :date
    add_column    :purchase_requisitions, :approved_by_level_three, :string
    add_column    :purchase_requisitions, :approved_by_level_three_date, :date
    add_column    :purchase_requisitions, :approved_by_level_four, :string
    add_column    :purchase_requisitions, :approved_by_level_four_date, :date
  end
end
