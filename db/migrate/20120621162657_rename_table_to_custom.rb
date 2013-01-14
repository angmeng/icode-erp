class RenameTableToCustom < ActiveRecord::Migration
  def change
    rename_column :customs, :sales_tax_exemption, :license_no
    rename_table  :customs, :sales_tax_exemption
    
  end
end
