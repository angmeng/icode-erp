class AddUserIdToSalesOrderItem < ActiveRecord::Migration
  def change
    add_column :sales_order_items, :user_id, :integer
    add_index :sales_order_items, :user_id
  end
end
