class AddUnitPriceToProductVendor < ActiveRecord::Migration
  def change
    add_column :product_vendors, :unit_price, :float, :default => 0.00000
  end
end
