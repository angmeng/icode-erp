class UnitMeasurement < ActiveRecord::Base
  before_save :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :code, :desc, :status
  
  KEEP_IN_VIEW = "KIV"
  ACTIVE = "ACTIVE"
  
  has_one :product
  has_one :purchase_requisition
  has_one :custom
  has_one :sales_tax_exemption
  has_one :sales_tax_exemption_barang
  has_one :sales_order_item
  has_one :ste_customer_history
  
  validates :code, :presence => true
  validates :code, :uniqueness => true
  
  has_one :hasone_from_um, :class_name => "Formulation", :foreign_key => "from_unit_measurement_id"
  has_one :hasone_to_um, :class_name => "Formulation", :foreign_key => "to_unit_measurement_id"
  
  has_one :has_one_cal_um, :class_name => "SalesTaxExemptionBarang", :foreign_key => "calculate_um_id"
  has_one :quotation_request_form
  has_one :stock_out
  
  default_scope order("code")
  
  scope :db_active, where(:status => UnitMeasurement::ACTIVE)

  def self.ordered_code(search)
    search.where(:status => UnitMeasurement::ACTIVE)
  end
  
  def self.ordered_code_kiv(search)
    search.where(:status => UnitMeasurement::KEEP_IN_VIEW)
  end
  
  def uppercase_text
    self.code.upcase! if self.code?
  end
end
