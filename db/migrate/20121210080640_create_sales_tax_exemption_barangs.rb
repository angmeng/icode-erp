class CreateSalesTaxExemptionBarangs < ActiveRecord::Migration
  def change
    create_table :sales_tax_exemption_barangs do |t|
      t.integer :sales_tax_exemption_id
      t.string :perihal_barang
      t.float :apply_qty, :default => 0
      t.float :complete_qty, :default => 0
      t.integer :unit_measurement_id
      t.string :tarif_code
      t.boolean :valid_condition, :default => TRUE

      t.timestamps
    end
    
    add_index :sales_tax_exemption_barangs, :sales_tax_exemption_id
    add_index :sales_tax_exemption_barangs, :unit_measurement_id
  end
end
