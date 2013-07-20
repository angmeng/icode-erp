class SteCustomerHistory < ActiveRecord::Base
  attr_accessible :accumulative_complete_qty, :after_available_qty, :before_available_qty, :delivery_order_item_id,
    :delivery_qty, :pc_weight, :product_id, :sales_tax_exemption_id, :trade_company_id, :unit_measurement_id, 
    :used_date
  
    belongs_to :delivery_order_item
    belongs_to :product
    belongs_to :sales_tax_exemption
    belongs_to :trade_company
    belongs_to :unit_measurement
end
