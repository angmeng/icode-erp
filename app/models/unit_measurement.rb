class UnitMeasurement < ActiveRecord::Base
  attr_accessible :code, :desc
  
  has_one :purchase_order_item
  
  validates :code, :desc, :presence => true
end
