class SalesTaxExemptionCustomerHistory < ActiveRecord::Base
  attr_accessible :delivery_order_item_id, :sales_tax_exemption_id, :trade_company_id, :unit_measurement_id, :used_date, :used_qty,
    :product_id, :before_available_qty, :after_available_qty, :accumulative_complete_qty, :delivery_qty, :pc_weight
  
  
end
