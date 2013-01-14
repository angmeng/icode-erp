class AddOperationToProductCategory < ActiveRecord::Migration
  def change
    add_column :product_categories, :operation, :boolean
  end
end
