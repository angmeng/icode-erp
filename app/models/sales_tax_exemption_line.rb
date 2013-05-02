class SalesTaxExemptionLine < ActiveRecord::Base
  attr_accessible :sales_tax_exemption_id, :trade_company_id, :validate_condition
  belongs_to :sales_tax_exemption
  belongs_to :trade_company
  
  validates :trade_company_id, :uniqueness => true
end
