class AddCreatedDateToHistoryInvoices < ActiveRecord::Migration
  def change
    add_column :history_invoices, :created_date, :date

    change_column :sales_tax_exemptions, :valid_condition, :boolean, :default => true
    remove_column :sales_tax_exemptions, :tarif_code
    remove_column :sales_tax_exemptions, :apply_qty
    remove_column :sales_tax_exemptions, :complete_qty
    remove_column :sales_tax_exemptions, :unit_measurement_id
    remove_column :sales_tax_exemptions, :remaining_total
    remove_column :sales_tax_exemptions, :perihal_barang
    add_column    :trade_companies, :decimal_point, :integer, :default => 2

#    30/4/2013
    add_column    :formulations, :status, :integer, :default => DataStatus::ACTIVE
    rename_column :sales_tax_exemptions, :valid_condition, :valid_date_condition
    rename_column :sales_tax_exemption_barangs, :valid_condition, :valid_weight_condition
    drop_table :sales_tax_exemption_items
    remove_column :delivery_orders, :sales_tax_exemption
    add_column    :delivery_orders, :sales_tax_exemption_id, :integer
  end
end
