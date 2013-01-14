class CreateProductCustomers < ActiveRecord::Migration
  def change
    create_table :product_customers do |t|
      t.integer :product_id
      t.integer :trade_company_id
      t.float   :selling_price, { :default => 0.0000, :scale => 10, :precision => 4 }
      
      t.timestamps
    end
    
    add_index :product_customers, :product_id
    add_index :product_customers, :trade_company_id
  end
end
