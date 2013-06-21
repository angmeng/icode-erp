class PurchaseOrderItemLine < ActiveRecord::Base
  attr_accessible :purchase_requisition_item_id, :purchase_order_id, :checked, :weight, :receive_note_id, :received_qty
  
  has_many :receive_note_items, :dependent => :destroy
  
  has_one  :ste_supplier_history
  
  belongs_to      :receive_note
  belongs_to      :purchase_requisition_item
  belongs_to      :purchase_order
end
