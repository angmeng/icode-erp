class ChangeColumnToProductPrice < ActiveRecord::Migration
  def change
    rename_column :product_prices, :current_id, :currency_id
    change_column(:product_prices, :unit_price, :decimal, {:default => 0.00000, :scale => 5, :precision => 10 })
  end
end
