class AddSalesTaxExemptionIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :sales_tax_exemption_id, :integer
    add_index :products, :sales_tax_exemption_id
  end
end
