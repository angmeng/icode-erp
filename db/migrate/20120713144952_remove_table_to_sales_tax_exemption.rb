class RemoveTableToSalesTaxExemption < ActiveRecord::Migration
  def change
    drop_table :sales_tax_exemption
  end
end
