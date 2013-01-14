class ChangeColumnOpeningStockToProduct < ActiveRecord::Migration
  def change
    change_column :products, :opening_stock, :integer, :default => 0
    change_column :products, :current_stock, :integer, :default => 0
  end
end
