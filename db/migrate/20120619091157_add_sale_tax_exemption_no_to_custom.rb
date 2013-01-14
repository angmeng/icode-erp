class AddSaleTaxExemptionNoToCustom < ActiveRecord::Migration
  def change
    add_column :customs, :sales_tax_exemption_no, :integer
  end
end
