class AddRemainingTotalToSalesTaxExemptionItem < ActiveRecord::Migration
  def change
    add_column :sales_tax_exemptions, :remaining_total, :float
  end
end
