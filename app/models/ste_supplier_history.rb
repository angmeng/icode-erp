class SteSupplierHistory < ActiveRecord::Base
  attr_accessible :accumulative_complete_qty, :after_available_qty, :before_available_qty, :product_id, :purchase_order_id, :sales_tax_exemption_id
end
