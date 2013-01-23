class SalesTaxExemptionManagement
  def self.connect_company(sales_tax_exemption)
    @tc = TradeCompany.find(sales_tax_exemption.trade_company_id)
    @tc.update_attributes(:sales_tax_exemption_id => sales_tax_exemption.id)
    
  end
end