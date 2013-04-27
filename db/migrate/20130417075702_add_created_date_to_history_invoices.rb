class AddCreatedDateToHistoryInvoices < ActiveRecord::Migration
  def change
#    add_column :history_invoices, :created_date, :date

    change_column :sales_tax_exemptions, :valid_condition, :boolean, :default => true
    remove_column :sales_tax_exemptions, :tarif_code
    remove_column :sales_tax_exemptions, :apply_qty
    remove_column :sales_tax_exemptions, :complete_qty
    remove_column :sales_tax_exemptions, :unit_measurement_id
    remove_column :sales_tax_exemptions, :remaining_total
    remove_column :sales_tax_exemptions, :perihal_barang
    
  end
end
