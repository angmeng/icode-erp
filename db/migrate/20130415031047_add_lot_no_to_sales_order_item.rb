class AddLotNoToSalesOrderItem < ActiveRecord::Migration
  def change
   # add_column :sales_order_items, :lot_no, :string
   # add_column :sales_order_items, :mfg_date, :string
   # add_column :sales_order_items, :exp_date, :string
    
   # remove_column :sales_orders, :lot_no
   # remove_column :sales_orders, :mfg_date
   # remove_column :sales_orders, :exp_date
    
   add_column :statement_of_accounts, :payment_received_id, :integer, :default => 0
   add_column :statement_of_accounts, :delivery_order_id, :integer, :default => 0
   add_index  :statement_of_accounts, :payment_received_id
   add_index  :statement_of_accounts, :delivery_order_id

   add_column :stock_outs, :previous_stock, :decimal, :precision => 10, :scale => 2, :default => 0.00

    
   
    add_column :product_running_numbers, :copied_no, :integer, :default => 0
  end
end
