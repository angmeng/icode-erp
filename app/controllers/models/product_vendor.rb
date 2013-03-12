class ProductVendor < ActiveRecord::Base
  attr_accessible :product_id, :trade_company_id, :unit_price
  
  belongs_to :product
  belongs_to :trade_company
end
