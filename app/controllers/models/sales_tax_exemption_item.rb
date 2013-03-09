class SalesTaxExemptionItem < ActiveRecord::Base
#  :remaining_total, :kgs,
  attr_accessible :product_id, :sales_tax_exemption_id, :receive_note_item_id, :purchase_order_id,
                  :before_available_qty, :after_available_qty, :accumulative_complete_qty
  
  belongs_to :product
  belongs_to :sales_tax_exemption
  belongs_to :receive_note_item
  belongs_to :purchase_order
end
