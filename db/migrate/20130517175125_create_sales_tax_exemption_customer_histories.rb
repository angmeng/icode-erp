class CreateSalesTaxExemptionCustomerHistories < ActiveRecord::Migration
  def change
    create_table :sales_tax_exemption_customer_histories do |t|
      t.integer :sales_tax_exemption_id
      t.integer :trade_company_id
      t.integer :delivery_order_item_id
      t.decimal :used_qty, :precision => 10, :scale => 2, :default => 0
      t.date :used_date
      t.integer :unit_measurement_id

      t.timestamps
    end
  end
end
