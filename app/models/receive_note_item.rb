class ReceiveNoteItem < ActiveRecord::Base
  attr_accessible :receive_note_id, :purchase_order_item_line_id, :received_qty, :order_qty, :vendor_part_no, :kgs
  
  belongs_to :receive_note
  belongs_to :purchase_order_item_line
  
  has_one    :inventory_history
  has_one    :sales_tax_exemption_item
  
end
