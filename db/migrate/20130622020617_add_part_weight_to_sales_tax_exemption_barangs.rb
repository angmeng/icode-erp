class AddPartWeightToSalesTaxExemptionBarangs < ActiveRecord::Migration
  def change
    add_column :sales_tax_exemption_barangs, :need_part_weight, :boolean, :default => false
  end
end