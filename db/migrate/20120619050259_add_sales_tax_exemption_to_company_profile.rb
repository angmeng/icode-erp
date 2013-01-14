class AddSalesTaxExemptionToCompanyProfile < ActiveRecord::Migration
  def change
    add_column :company_profiles, :sn_sales_tax_exemption_no, :integer
  end
end
