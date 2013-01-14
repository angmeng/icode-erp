class AddPerihalBarangToSalesTaxExemption < ActiveRecord::Migration
  def up
    add_column :sales_tax_exemptions, :perihal_barang, :string
    add_column :sales_tax_exemptions, :registration_no, :string
    add_column :sales_tax_exemption_items, :purchase_order_id, :integer
  end
  
  def down
    remove_column :sales_tax_exemptions, :perihal_barang
    remove_column :sales_tax_exemptions, :registration_no
    remove_column :sales_tax_exemption_items, :purchase_order_id
  end
end
