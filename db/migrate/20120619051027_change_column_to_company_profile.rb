class ChangeColumnToCompanyProfile < ActiveRecord::Migration
  def change
    change_column :company_profiles, :sn_sales_tax_exemption_no, :integer, :default => 0
  end
end
