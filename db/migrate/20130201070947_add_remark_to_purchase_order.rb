class AddRemarkToPurchaseOrder < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :remark, :string, :limit => 255
    remove_column :product_categories, :operation
    remove_column :product_categories, :more_category
    remove_column :product_categories, :keep_in_view
  end
end
