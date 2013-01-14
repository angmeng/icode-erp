class CreateSalesTaxExemptions < ActiveRecord::Migration
  def change
    create_table :sales_tax_exemptions do |t|
      t.integer :sales_tax_exemption_no
      t.string :license_no
      t.integer :trade_company_id
      t.date :period_start
      t.date :period_end
      t.string :tarif_code
      t.integer :apply_qty
      t.integer :complete_qty
      t.integer :unit_measurement_id

      t.timestamps
    end
  end
end
