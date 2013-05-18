class SalesTaxExemptionCustomerHistory < ActiveRecord::Base
  attr_accessible :delivery_order_item_id, :sales_tax_exemption_id, :trade_company_id, :unit_measurement_id, :used_date, :used_qty
end
