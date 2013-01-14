class AddCategoryTypeToProductCategory < ActiveRecord::Migration
  def change
    add_column :product_categories, :category_type, :integer
  end
end
