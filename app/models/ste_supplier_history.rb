class SteSupplierHistory < ActiveRecord::Base
  attr_accessible :accumulative_complete_qty, :after_available_qty, :before_available_qty, :product_id, :purchase_order_id, :sales_tax_exemption_id, :purchase_order_item_line_id
  belongs_to :product
  belongs_to :purchase_order
  belongs_to :sales_tax_exemption
  belongs_to :purchase_order_item_line
end
