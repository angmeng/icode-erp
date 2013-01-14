class AddColumnToProductPrice < ActiveRecord::Migration
  def change
    add_column :product_prices, :part_no, :string
  end
end
