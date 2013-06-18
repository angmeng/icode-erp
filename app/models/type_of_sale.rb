class TypeOfSale < ActiveRecord::Base
  attr_accessible :description, :name
  
  has_one :delivery_order
  
  has_many :trade_companies
  
  validates :name, :uniqueness => true
  
  default_scope order("name")
  
  SALES_WITH_TAX = self.find_by_name("SALES WITH TAX").id
  LOCAL_SALES_MAS = self.find_by_name("LOCAL SALES (MAS)").id
  OTHERS = self.find_by_name("OTHERS").id
  FREE_TRADE_ZONE = self.find_by_name("FREE TRADE ZONE").id
  LMW_EXEMPTION_WL = self.find_by_name("LMW EXEMPTION / WL").id
  CJ5_LICENCE_MANUFACTURER = self.find_by_name("CJ5 LICENCE MANUFACTURER").id
  EXPORT_SALES = self.find_by_name("EXPORT SALES").id
  IMPORT = self.find_by_name("IMPORT").id
end
