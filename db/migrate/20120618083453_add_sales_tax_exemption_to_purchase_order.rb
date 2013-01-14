class AddSalesTaxExemptionToPurchaseOrder < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :sales_tax_exemption_id, :integer
  end
end
