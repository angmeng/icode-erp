class ChangeSalesTaxExemptionToTradeCompany < ActiveRecord::Migration
  def change
    rename_column :trade_companies, :sales_tax_exemption, :sales_tax_exemption_id
  end
end
