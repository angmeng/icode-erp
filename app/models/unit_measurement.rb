class UnitMeasurement < ActiveRecord::Base
  attr_accessible :code, :desc
  
  has_one :product
  has_one :purchase_requisition
  has_one :custom
  has_one :sales_tax_exemption
  has_one :sales_order_item
  
  validates :code, :presence => true
  validates :code, :uniqueness => true
  
  has_one :from_unit_measurement_id, :class_name => "Formulation", :foreign_key => "from_unit_measurement_id"
  has_one :to_unit_measurement_id, :class_name => "Formulation", :foreign_key => "to_unit_measurement_id"
  has_one :quotation_request_form

  def self.ordered
    order("code").all
  end
end
