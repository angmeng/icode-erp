class CreateCustoms < ActiveRecord::Migration
  def change
    create_table :customs do |t|
      t.string :sales_tax_exemption
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
