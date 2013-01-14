class AddIconToProductCategory < ActiveRecord::Migration
  def change
    add_column :product_categories, :icon, :integer
  end
end
