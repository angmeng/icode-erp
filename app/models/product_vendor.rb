class ProductVendor < ActiveRecord::Base
  attr_accessible :product_id, :trade_company_id, :unit_price, :currency_id
  
  belongs_to :product
  belongs_to :trade_company
  belongs_to :currency
end
