class AddRemoveToPurchaseRequisition < ActiveRecord::Migration
  def change
    remove_column :purchase_requisitions, :product_id
    remove_column :purchase_requisitions, :trade_company_id
    remove_column :purchase_requisitions, :description
    remove_column :purchase_requisitions, :quantity
    remove_column :purchase_requisitions, :unit_measurement_id
    remove_column :purchase_requisitions, :eta
    remove_column :purchase_requisitions, :purchase_order_no
    remove_column :purchase_requisitions, :unit_price
    remove_column :purchase_requisitions, :decimal
    remove_column :purchase_requisitions, :remark
    add_column    :purchase_requisitions, :issued_by, :string
    

  end
end
