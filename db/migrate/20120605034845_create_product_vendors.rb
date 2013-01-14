class CreateProductVendors < ActiveRecord::Migration
  def change
    create_table :product_vendors do |t|
      t.integer :product_id
      t.integer :trade_company_id

      t.timestamps
    end
    add_index :product_vendors, :product_id
    add_index :product_vendors, :trade_company_id
  end
end
