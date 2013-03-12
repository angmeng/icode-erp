class ReceivedItemAndQty < ActiveRecord::Base
  attr_accessible :purchase_order_item_line_id, :receive_note_id, :received_qty
  
  belongs_to :purchase_order_item_line
  belongs_to :receive_note
end
