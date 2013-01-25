# start rollback 23/1/2013
# close rollback 
class AddRecoverStatusToPurchaseRequisition < ActiveRecord::Migration
  def change
    add_column :purchase_requisitions, :recover_status, :string
    add_column :purchase_requisition_items, :skip_to_purchase_order, :boolean, :default => false
    
    add_column :sales_tax_exemption_barangs, :available_qty, :float, :default => '0.00'
    add_column :sales_tax_exemption_barangs, :calculate_um_id, :integer
    
#    remove_column :sales_tax_exemption_items, :remaining_total
#    remove_column :sales_tax_exemption_items, :kgs
    
    add_column :sales_tax_exemption_items, :before_available_qty, :integer, :default => 0
    add_column :sales_tax_exemption_items, :after_available_qty, :integer, :default => 0
    add_column :sales_tax_exemption_items, :accumulative_complete_qty, :integer, :default => 0
    
#    drop_table :group_running_nos
#    drop_table :product_prices
#    drop_table :temporary_tarif_codes
  end
end
