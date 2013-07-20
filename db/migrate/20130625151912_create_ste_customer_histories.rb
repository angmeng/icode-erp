class CreateSteCustomerHistories < ActiveRecord::Migration
  def change
    create_table :ste_customer_histories do |t|
      t.integer :sales_tax_exemption_id
      t.integer :product_id
      t.integer :trade_company_id
      t.integer :delivery_order_item_id
      t.integer :unit_measurement_id
      
      t.decimal :before_available_qty, :precision => 10, :scale => 2, :default => 0.00
      t.decimal :after_available_qty, :precision => 10, :scale => 2, :default => 0.00
      t.decimal :accumulative_complete_qty, :precision => 10, :scale => 2, :default => 0.00
      
      t.decimal :delivery_qty, :precision => 10, :scale => 2, :default => 0.00
      t.float :pc_weight, :precision => 10, :scale => 6, :default => 0.000000
      t.date :used_date

      t.timestamps
    end
    add_index :ste_customer_histories, :sales_tax_exemption_id
    add_index :ste_customer_histories, :product_id
    add_index :ste_customer_histories, :trade_company_id
    add_index :ste_customer_histories, :delivery_order_item_id
    add_index :ste_customer_histories, :unit_measurement_id
  end
end