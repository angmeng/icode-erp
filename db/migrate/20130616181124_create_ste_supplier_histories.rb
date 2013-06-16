class CreateSteSupplierHistories < ActiveRecord::Migration
  def change
    create_table :ste_supplier_histories do |t|
      t.integer :sales_tax_exemption_id
      t.integer :product_id
      t.integer :purchase_order_id
      t.decimal :before_available_qty, :precision => 10, :scale => 2, :default => 0.00
      t.decimal :after_available_qty, :precision => 10, :scale => 2, :default => 0.00
      t.decimal :accumulative_complete_qty, :precision => 10, :scale => 2, :default => 0.00

      t.timestamps
    end
    add_index :ste_supplier_histories, :sales_tax_exemption_id
    add_index :ste_supplier_histories, :product_id
    add_index :ste_supplier_histories, :purchase_order_id
  end
end