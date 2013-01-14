class AddKeepInViewToProductCategory < ActiveRecord::Migration
  def change
    add_column :product_categories, :keep_in_view, :boolean, :default => false
  end
end