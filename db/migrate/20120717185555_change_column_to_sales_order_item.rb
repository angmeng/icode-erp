class ChangeColumnToSalesOrderItem < ActiveRecord::Migration
  def change
    change_column :sales_order_items, :part_no, :string
  end
end
