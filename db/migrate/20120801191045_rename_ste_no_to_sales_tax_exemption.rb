class RenameSteNoToSalesTaxExemption < ActiveRecord::Migration
  def change
    rename_column :sales_tax_exemptions, :sales_tax_exemption_no, :ste_no
    rename_column :sales_tax_exemptions, :licence_no, :sales_tax_exemption_no
  end
end
