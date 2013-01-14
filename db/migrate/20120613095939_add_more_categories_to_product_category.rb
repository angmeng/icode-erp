class AddMoreCategoriesToProductCategory < ActiveRecord::Migration
  def change
    add_column :product_categories, :more_category, :integer
  end
end
