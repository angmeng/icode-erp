class SalesTaxExemptionItem < ActiveRecord::Base
  attr_accessible :product_id, :remaining_total, :sales_tax_exemption_id, :receive_note_item_id, :kgs, :purchase_order_id
  
  belongs_to :product
  belongs_to :sales_tax_exemption
  belongs_to :receive_note_item
  belongs_to :purchase_order
end
