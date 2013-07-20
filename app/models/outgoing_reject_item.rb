class OutgoingRejectItem < ActiveRecord::Base
  attr_accessible :client_lot, :client_part, :client_po, :current_stock, :invoice_delivery_qty, :invoice_unit_price, :quantity, :received_qty, :so_balance_qty, :status, :outgoing_reject_id, :sales_order_item_id, :delivery_order_item_id
  belongs_to :outgoing_reject
  belongs_to :sales_order_item
  belongs_to :delivery_order_item
end
