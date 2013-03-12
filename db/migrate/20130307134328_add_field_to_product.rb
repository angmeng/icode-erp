class AddFieldToProduct < ActiveRecord::Migration
  def change
    add_column :products, :category, :string
    add_column :products, :window_code, :string
    add_column :products, :revision, :string
    add_column :products, :current_price, :decimal, :precision => 10, :scale => 2, :default => 0
    
    add_column :product_comboboxes, :old_product_code, :string
    
    add_column :product_categories, :open_product_id, :boolean, :default => false
    add_column :product_categories, :active_common, :boolean, :default => false
    
    add_column :product_running_numbers, :product_category_id, :integer
    add_index  :product_running_numbers, :product_category_id
  end
end
