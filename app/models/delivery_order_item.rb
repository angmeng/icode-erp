class DeliveryOrderItem < ActiveRecord::Base
  attr_accessible :balance_qty, :client_lot, :client_po, :delivery_qty, :department, :dept_current_stock, :do_status, :gen_current_stock, :no_of_carton, :order_qty, :part_no, :sales_order_item_id, :so_date, :unit_price, :delivery_order_id
  
  belongs_to :delivery_order
  belongs_to :sales_order_item
  
  validates :sales_order_item_id, :delivery_qty, :unit_price, :presence => true
end
