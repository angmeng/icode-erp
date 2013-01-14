class AddSalesTaxLicenceNoToTradeCompany < ActiveRecord::Migration
  def change
    add_column :trade_companies, :sales_tax_licence_no, :string
    add_column :trade_companies, :warehouse_licence_no, :string
    add_column :trade_companies, :mfg_warehosue_licence_no, :string
  end
end
