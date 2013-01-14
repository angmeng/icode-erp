class ChangeOldToNewTable < ActiveRecord::Migration
  def change
      rename_table :categories, :product_categories
      rename_table :purchase_order_items, :products
      rename_column :products, :tariff_code, :tarif_code
      add_column :products, :product_category_id, :integer
  end 
end
