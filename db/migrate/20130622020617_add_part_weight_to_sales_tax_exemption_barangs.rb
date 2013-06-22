class AddPartWeightToSalesTaxExemptionBarangs < ActiveRecord::Migration
  def change
    add_column :sales_tax_exemption_barangs, :part_weight, :boolean
  end
end