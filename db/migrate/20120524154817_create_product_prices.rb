class CreateProductPrices < ActiveRecord::Migration
  def change
    create_table :product_prices do |t|
      t.integer :trade_company_id
      t.integer :product_category_id
      t.integer :current_id
      t.decimal :unit_price
      t.integer :price_in

      t.timestamps
    end
    add_index :product_prices, :trade_company_id
    add_index :product_prices, :product_category_id
  end
end
