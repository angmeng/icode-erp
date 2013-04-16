class AddLotNoToSalesOrderItem < ActiveRecord::Migration
  def change
    add_column :sales_order_items, :lot_no, :string
    add_column :sales_order_items, :mfg_date, :string
    add_column :sales_order_items, :exp_date, :string
    
#    remove_column :sales_orders, :lot_no
#    remove_column :sales_orders, :mfg_date
#    remove_column :sales_orders, :exp_date
  end
end
