class AddColumnToDeliveryOrder < ActiveRecord::Migration
  def change
    add_column :delivery_orders, :authorize_print, :boolean , :default => false
    
    change_column :delivery_order_items, :do_status, :integer, :default => DataStatus::DOI_PENDING
    remove_column :sales_order_items, :description
    remove_column :sales_order_items, :current_stock
    remove_column :sales_order_items, :complete_qty
    remove_column :sales_order_items, :user_id
    remove_column :sales_order_items, :um_name
    remove_column :sales_order_items, :trade_company_id
    add_column :sales_order_items, :remaining_qty, :integer, :default => 0
    
  end
end